package org.music.web;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.music.annotation.MusicAnnotation;
import org.music.entity.*;
import org.music.redis.MusicRedis;
import org.music.service.impl.MusicServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


@Controller
@RequestMapping("/")
public class MusicController {
    @Autowired
    MusicServiceImpl musicService;

    @Autowired
    MusicRedis redis;

    public MusicController() {
    }

    @RequestMapping(
            value = {"/login"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public User login(User user) {
        boolean flag = this.musicService.check(user.getUser(), user.getPassword());
        return flag ? this.musicService.login(user.getUser()) : null;
    }

    @RequestMapping({"/login"})
    public String showLogin() {
        return "login";
    }

    @RequestMapping(
            value = {"/register"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public User register(User user) {
        User u = this.musicService.login(user.getUser());
        if (u == null) {
            this.musicService.insertInfo(user.getName(), user.getUser(), user.getPassword());
        }

        return u;
    }

    @RequestMapping({"/register"})
    public String showRegister() {
        return "register";
    }

    @RequestMapping(
            value = {"/index"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public String indexInfo(UserListen userListen) {
        this.musicService.insertMusic(userListen.getUser(), userListen.getMusicName(), userListen.getAddress());
        return "index";
    }

    @MusicAnnotation
    @RequestMapping(
            value = {"index","/"},
            method = {RequestMethod.GET}
    )
    public String indexGet(Model model) {
        List<UserListen> hottest = new Gson().fromJson(redis.hget("index","hottest"),new TypeToken<List<UserListen>>(){}.getType());
        if (hottest==null){
            hottest = this.musicService.queryHottestMusic();
            redis.hset("index","hottest",new Gson().toJson(hottest));
        }
        model.addAttribute("flushMusic", this.flush());
        model.addAttribute("hottest", hottest);
        return "index";
    }

    public List<MusicList> flush() {
        List<MusicList> flushMusic = new ArrayList();
        List<MusicList> resource = redis.musicListHget("list","musicList");

        if (resource==null) {
            resource = musicService.queryAllMusicList();
            redis.hset("list","musicList",new Gson().toJson(resource));
        }

        for (int i=0;i<8;i++){
            flushMusic.add((resource.get((int) (Math.random()*resource.size()))));
        }
        return flushMusic;
    }

    @MusicAnnotation
    @RequestMapping({"/music-list/{musicType}"})
    public String musicToList(Model model, @PathVariable(value = "musicType",required = false) String musicType) {
        List<MusicList> musicLists = redis.musicListHget("list",musicType);
        if (musicLists==null){
            musicLists = musicService.queryMusicList(musicType);
            redis.hset("list",musicType,redis.object2String(musicLists));
        }
        model.addAttribute("musicLists", musicLists);
        return "music-list";
    }

    @MusicAnnotation
    @RequestMapping({"/music-list/{musicType}/{musicFlag}"})
    public String musicDetail(Model model, @PathVariable(value = "musicFlag",required = false) Integer musicFlag, @PathVariable("musicType") String musicType, Collect collect, @CookieValue(value = "user",required = false) Integer user) {
        int index = 0;
        if (collect.getUser() != null) {
            this.musicService.insertToCollect(collect.getUser(), collect.getMusicType(), collect.getPicture(), collect.getTopic(), collect.getIntroduced(), collect.getMusicFlag());
        }

        if (user != null) {
            List<Collect> collect1 = this.musicService.queryCollectMusic(user);

            for(Iterator var8 = collect1.iterator(); var8.hasNext(); ++index) {
                Collect cl = (Collect)var8.next();
                if (cl.getMusicFlag() == musicFlag) {
                    model.addAttribute("topic", cl.getTopic());
                    break;
                }
            }

            if (index == collect1.size()) {
                model.addAttribute("topic", "");
            }
        }

        MusicList musicList = redis.detailHget(redis.musicListHget("list",musicType),musicFlag);
        if (musicList==null){
            musicList = musicService.queryMusicDetail(musicFlag,musicType);
        }
        List<MusicDetailMusic> lists = redis.musicDetailMusicsHget(String.valueOf(musicFlag),musicType);
        if (lists.size()==0){
            lists = this.musicService.queryMusicInfo(musicFlag, musicType);
        }
        model.addAttribute("musicList", musicList);
        model.addAttribute("lists", lists);
        model.addAttribute("musicType", musicType);
        return "music-list-detail";
    }

    @RequestMapping({"/MyMusic"})
    public String MyMusic(Model model, @CookieValue(value = "user",required = false) Integer user) {
        List<UserListen> list = this.musicService.queryAll(user);
        model.addAttribute("list", list);
        return "MyMusic";
    }

    @RequestMapping(
            value = {"/MyMusic"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public int clearMusic(UserListen userListen) {
        return this.musicService.deleteMusic(userListen.getUser());
    }

    @RequestMapping({"/MyMusic-list"})
    public String MyMusicList(Model model, @CookieValue(value = "user",required = false) Integer user) {
        List<Collect> lists = this.musicService.queryCollectMusic(user);
        model.addAttribute("lists", lists);
        return "MyMusic-list";
    }

    @RequestMapping(
            value = {"/MyMusic-list"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public int deleteMusicList(Collect collect) {
        return this.musicService.deleteMusicList(collect.getUser(), collect.getMusicFlag());
    }

    @MusicAnnotation
    @RequestMapping(
            value = {"/search"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public List<MusicDetailMusic> searchMusic(MusicDetailMusic musicDetailMusic) {
        List<MusicDetailMusic> music = null;
        if (musicDetailMusic.getMusicName() != null) {
            music = this.musicService.queryMusicByName(musicDetailMusic.getMusicName());
        }

        return music;
    }

    @RequestMapping(
            value = {"search"},
            method = {RequestMethod.GET}
    )
    public String showSearch() {
        return "search";
    }

    @RequestMapping(
            value = {"manage"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public int manageInfo(User user) {
        int i = 0;
        if (user.getName() == null && user.getPassword() == null) {
            i = this.musicService.deleteUserInfo(user.getUser());
        } else if (user.getName() == null) {
            i = this.musicService.updateInfo(user.getUser(), user.getPassword());
        } else {
            User u = this.musicService.login(user.getUser());
            if (u == null) {
                i = this.musicService.insertInfo(user.getName(), user.getUser(), user.getPassword());
            }
        }

        return i;
    }

    @RequestMapping({"manage"})
    public String showManage(Model model) {
        List<User> users = this.musicService.queryAllUser();
        model.addAttribute("users", users);
        return "manage";
    }

    @RequestMapping(
            value = {"manage-music-list"},
            method = {RequestMethod.POST},
            produces = {"application/json;charset=utf-8"}
    )
    @ResponseBody
    public int manageMusicList(MusicList musicList) {
        return this.musicService.deleteMusicList(musicList.getTopic());
    }

    @RequestMapping({"manage-music-list"})
    public String showManageMusic(Model model) {
        List<MusicList> musicLists = this.musicService.queryAllMusicList();
        model.addAttribute("musicLists", musicLists);
        return "manage-music-list";
    }
}
