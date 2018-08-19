package org.music.getData;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.music.entity.MusicDetailMusic;
import org.music.entity.MusicList;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TestMain {
    public TestMain() {
    }

    public static void main(String[] args) {
        //getMusicList("http://www.kugou.com/yy/html/special.html","recommend");
        //getMusicList("http://www.kugou.com/yy/html/special.html","hottest");
      //  getMusicList("http://www.kugou.com/yy/html/special.html","Heat-reservoir");
       // getMusicList("http://www.kugou.com/yy/html/special.html","rise");
    }

/*
    public static void getMusicList(String str, String musicType) {
        Document d = null;

        try {
            d = Jsoup.connect(str).get();
        } catch (IOException var18) {
            var18.printStackTrace();
        }

        List<MusicList> list = new ArrayList();
        int index = 1;
        Iterator var6 = d.select(".text").iterator();

        MusicList musicList;
        Element element;
        while(var6.hasNext()) {
            element = (Element)var6.next();
            musicList = new MusicList();
            musicList.setMusicType(musicType);
            musicList.setMusicFlag(index);
            ++index;
            musicList.setDetail(element.text());
            list.add(musicList);
        }

        index = 0;
        var6 = d.select(".pic a img").iterator();

        while(var6.hasNext()) {
            element = (Element)var6.next();
            musicList = (MusicList)list.get(index);
            ++index;
            musicList.setPicture(element.attr("_src"));
        }

        index = 0;
        var6 = d.select("strong a").iterator();

        while(var6.hasNext()) {
            element = (Element)var6.next();
            musicList = (MusicList)list.get(index);
            ++index;
            musicList.setTopic(element.attr("title"));
        }

        index = 0;
        var6 = d.select(".top em").iterator();

        while(var6.hasNext()) {
            element = (Element)var6.next();
            musicList = (MusicList)list.get(index);
            ++index;
            musicList.setAuthor(element.text().trim());
        }

        List<MusicDetail> listMd = new ArrayList();
        Iterator var8 = list.iterator();

        while(var8.hasNext()) {
            MusicList m = (MusicList)var8.next();
            MusicDetail md = new MusicDetail();
            md.setPicture(m.getPicture());
            md.setMusicFlag(m.getMusicFlag());
            md.setMusicListAuthor(m.getAuthor());
            md.setMusicListName(m.getTopic());
            md.setMusicListIntroduce(m.getDetail());
            md.setMusicType(m.getMusicType());
            listMd.add(md);
        }

        StringBuilder s = new StringBuilder("insert into music_detail(music_flag,picture,music_list_name,music_list_author,music_list_introduce,music_type)values\n");
        int k = 1;
        Iterator var10 = listMd.iterator();

        MusicDetail m;
        while(var10.hasNext()) {
            m = (MusicDetail)var10.next();
            s.append(m.toString());
            if (k < listMd.size()) {
                ++k;
                s.append(",\n");
            } else {
                s.append(";");
            }
        }

        File file = new File("E:\\酷狗音乐\\" + musicType + "歌单介绍栏.txt");
        m = null;

        try {
            FileWriter writer = new FileWriter(file);
            writer.write(s.toString());
            writer.close();
        } catch (IOException var17) {
            var17.printStackTrace();
        }

        StringBuilder sb = new StringBuilder("insert into music_list(music_type,picture,topic,detail,author,music_flag)values\n");
        index = 1;
        Iterator var13 = list.iterator();

        MusicList ml;
        while(var13.hasNext()) {
            ml = (MusicList)var13.next();
            sb.append(ml.toString());
            if (index < list.size()) {
                ++index;
                sb.append(",\n");
            } else {
                sb.append(";");
            }
        }

        File file1 = new File("E:\\酷狗音乐\\" + musicType + "歌单.txt");
        m = null;

        try {
            FileWriter writer1 = new FileWriter(file1);
            writer1.write(sb.toString());
            writer1.close();
        } catch (IOException var16) {
            var16.printStackTrace();
        }

        getDetailMusic(d, musicType);
    }
*/

    public static void getDetailMusic(Document d, String musicType) {
        List<String> str = new ArrayList();
        Iterator var3 = d.select("strong a").iterator();

        while(var3.hasNext()) {
            Element element = (Element)var3.next();
            str.add(element.attr("href"));
        }

        List<MusicDetailMusic> mdm = new ArrayList();

        Iterator var7;
        Element element;
        for(int i = 0; i < str.size(); ++i) {
            Document doc = null;

            try {
                doc = Jsoup.connect((String)str.get(i)).get();
            } catch (IOException var11) {
                var11.printStackTrace();
            }

            var7 = doc.select(".text i").iterator();

            while(var7.hasNext()) {
                element = (Element)var7.next();
                MusicDetailMusic musicDetailMusic = new MusicDetailMusic();
                musicDetailMusic.setMusicFlag(i + 1);
                musicDetailMusic.setMusicName(element.text());
                musicDetailMusic.setMusicType(musicType);
                mdm.add(musicDetailMusic);
            }
        }

        StringBuilder sbr = new StringBuilder("insert into music_detail_music(music_flag,music_name,music_type)values\n");
        int j = 1;
        var7 = mdm.iterator();

        while(var7.hasNext()) {
            MusicDetailMusic m = (MusicDetailMusic)var7.next();
            if (j < mdm.size()) {
                sbr.append(m.toString() + ",\n");
                ++j;
            } else {
                sbr.append(m.toString() + ";\n");
            }
        }

        File file = new File("E:\\酷狗音乐\\" + musicType + ".txt");
        element = null;

        try {
            FileWriter writer = new FileWriter(file);
            writer.write(sbr.toString());
            writer.close();
        } catch (IOException var10) {
            var10.printStackTrace();
        }

    }
}
