package org.music.redis;

import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import org.music.entity.MusicDetailMusic;
import org.music.entity.MusicList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class MusicRedis {
    private final JedisPool jedisPool;
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final RuntimeSchema<MusicList> schema = RuntimeSchema.createFrom(MusicList.class);

    public MusicRedis(String ip,int port){
        jedisPool = new JedisPool(ip,port);
    }


      public long hset(String hkey,String key,String value){
          Jedis jedis = jedisPool.getResource();
          long result = jedis.hset(hkey,key,value);
          jedis.close();
          return result;
      }

      public String hget(String hkey,String key){
          Jedis jedis = jedisPool.getResource();
          String result = jedis.hget(hkey,key);
          jedis.close();
          return result;
      }

      public void musicListHset(String hkey,String key,List<MusicList> lists){
        Jedis jedis = jedisPool.getResource();
        List<MusicList> recommend = new LinkedList<>();
        List<MusicList> hottest = new LinkedList<>();
        List<MusicList> reservoir = new LinkedList<>();
        List<MusicList> rise = new LinkedList<>();

        int size = lists.size();
        for (int i = 0; i<size;i++){
            if (lists.get(i).getMusicType().equalsIgnoreCase("recommend")){
                recommend.add(lists.get(i));
                continue;
            }

            if (lists.get(i).getMusicType().equalsIgnoreCase("hottest")){
                hottest.add(lists.get(i));
                continue;
            }

            if (lists.get(i).getMusicType().equalsIgnoreCase("Heat-reservoir")){
                reservoir.add(lists.get(i));
                continue;
            }

            if (lists.get(i).getMusicType().equalsIgnoreCase("rise")){
                rise.add(lists.get(i));
                continue;
            }
        }
        jedis.hset(hkey,"recommend",object2String(recommend));
        jedis.hset(hkey,"hottest",object2String(hottest));
        jedis.hset(hkey,"Heat-reservoir",object2String(reservoir));
        jedis.hset(hkey,"rise",object2String(rise));
        jedis.hset(hkey,key,object2String(lists));
        jedis.close();
      }

      public List<MusicList> musicListHget(String hkey,String key){
        Jedis jedis = jedisPool.getResource();
        List<MusicList> lists = string2Object(jedis.hget(hkey,key));
        jedis.close();
        return lists;
      }

      public MusicList detailHget(List<MusicList> lists,int musicFlag){
        for (MusicList m :lists){
            if (m.getMusicFlag()==musicFlag)
                return m;
        }
        return null;
      }


      public void musicDetailMusicsHset(String hkey,String key,List<MusicDetailMusic> music){
            Jedis jedis = jedisPool.getResource();
            for (int i = 0;i<music.size();i++){
                if (music.get(i).getMusicType().equalsIgnoreCase("recommend")) {
                    jedis.sadd("recommend",object2String(music.get(i)));
                    jedis.sadd(String.valueOf(music.get(i).getMusicFlag()),object2String(music.get(i)));
                    continue;
                }

                if (music.get(i).getMusicType().equalsIgnoreCase("hottest")) {
                    jedis.sadd("hottest",object2String(music.get(i)));
                    jedis.sadd(String.valueOf(music.get(i).getMusicFlag()),object2String(music.get(i)));
                    continue;
                }

                if (music.get(i).getMusicType().equalsIgnoreCase("Heat-reservoir")) {
                    jedis.sadd("Heat-reservoir",object2String(music.get(i)));
                    jedis.sadd(String.valueOf(music.get(i).getMusicFlag()),object2String(music.get(i)));
                    continue;
                }

                if (music.get(i).getMusicType().equalsIgnoreCase("rise")) {
                    jedis.sadd("rise",object2String(music.get(i)));
                    jedis.sadd(String.valueOf(music.get(i).getMusicFlag()),object2String(music.get(i)));
                    continue;
                }
            }
            jedis.hset(hkey,key,object2String(music));
            jedis.close();
      }

      public List<MusicDetailMusic> musicDetailMusicsHget(String flag,String type){
          Jedis jedis = jedisPool.getResource();
          Set<String> set = jedis.sinter(flag,type);
          List<MusicDetailMusic> list = new LinkedList<>();
          for (String str : set){
              list.add((MusicDetailMusic) new Gson().fromJson(str,new TypeToken<MusicDetailMusic>(){}.getType()));
          }
          return list;
      }


      public String object2String(Object o){
        return new GsonBuilder().serializeNulls().create().toJson(o);
      }

      public List<MusicList> string2Object(String str){
        List<MusicList> o = new Gson().fromJson(str,new TypeToken<List<MusicList>>(){}.getType());
        return o;
      }

}
