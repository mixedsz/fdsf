Config = {}

Config.UIColor = { r: 68, g: 138, b: 255 } // Default: Blue
Config.BackgroundVideo = true // true it will use a video (video/.webm), false it will use a carousel of images (slide/.jpg)
Config.UseYoutubeVideo = false // true it will use a youtube video, false it will use a local video (video/.webm)
Config.YoutubeVideoID = 'uMY9hm0Z_s4' // Youtube video ID (The ID is the last part of the URL after 'watch?v=')
Config.UpdateCarouselTime = 6; // Time in seconds

Config.ServerName = {
    first: "Gulf Coast",
    second: "Redzone",
    thr: "Version 1"
}

// Social Media Configuration
// Available platforms: Discord, YouTube, TikTok, Instagram, Telegram, Website
// Only add the platforms you want to display - remove or comment out the ones you don't need
Config.SocialMedia = {
    ["Discord"]: {
        link: "https://discord.gg/bDU43jPvzy",
        name: "Discord Server",
        desc: "Join Gulf Coast Redzone Discord – connect, compete, and stay in the loop with the community!"
    },
   // ["YouTube"]: {
       // link: "https://www.youtube.com/@flakedevelopment",
        //name: "YouTube Page",
        //desc: "Subscribe to City Of Compton on YouTube for highlights, updates, and exclusive content!"
   // },
    //["TikTok"]: {
      //  link: "https://www.tiktok.com/@yourserver",
      //  name: "TikTok Page",
      //  desc: "Follow City Of Compton on TikTok for highlights, updates, and exclusive content!"
   // },
    // Uncomment and configure the platforms you want to use:
    // ["Instagram"]: {
    //     link: "https://www.instagram.com/yourserver",
    //     name: "Instagram Page",
    //     desc: "Follow us on Instagram for behind-the-scenes content and community highlights!"
    // },
    // ["Telegram"]: {
    //     link: "https://t.me/yourserver",
    //     name: "Telegram Channel",
    //     desc: "Join our Telegram channel for instant updates and community discussions!"
    // },
    // ["Website"]: {
    //     link: "https://yourserver.com",
    //     name: "Official Website",
    //     desc: "Visit our official website for news, updates, and server information!"
    // },
}

Config.Team = {
    1: {
        name: "Ron",
        rank: "Server Owner",
        img: "team/3.png",
        desc: "Ron – Creative Director responsible for the server’s design, visual identity, and overall creative direction."
    },
    2: {
        name: "Blakkjit",
        rank: "Server Owner",
        img: "team/2.png",
        desc: "Overseer and key part of the server’s leadership, handling server ownership and community management."
    },
    3: {
        name: "Flake Development",
        rank: "Developer",
        img: "team/6.png",
        desc: "Head Developer contributing to core features, updates and community management for smooth operations within the player base."
    },
    4: {
        name: "Sergeant Major",
        rank: "Server Owner",
        img: "team/4.png",
        desc: "Overseer and key part of the server’s leadership, handling server ownership and community management."
    },
   // 5: {
     //   name: "FSG",
       //// rank: "Developer",
        //img: "team/5.gif",
       // desc: "Lead developer who builds and maintains the backbone of the server, turning ideas into smooth, working features."
  //  },
    //6: {
     //   name: "Flexxin",
       // rank: "Developer",
       // img: "team/6.png",
       // desc: "Developer contributing to core features, updates and community management for smooth operations within the player base."
   // },
};


Config.Rules = {
    1: "Use /help to see your skill points and see what skills you can unlock!",
    2: "No metagaming: Don’t use out-of-character info to influence your in-character actions.",
    3: "No powergaming: Don’t force actions on others or do unrealistic things your character couldn’t do.",
    4: "No combat logging: Don’t log out during active situations like fights or arrests.",
    5: "Respect character roles: Don’t act like a cop, medic, or other role unless your character is one.",
    6: "Value your life: Don’t do reckless things your character wouldn’t risk without strong reason.",
}


Config.Gallery = {
     1: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/image-enhanced_1.png",
     2: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/IMG_1037.jpg",
     3: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/enhanced_7f756e93-24f5-46f2-8690-31f59701ec7c.png",
     4: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/IMG_0748.jpg",
     5: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/img.webp",
     6: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/image-enhanced_2.png",
    // 7: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/SSSSSSSSSS.png",
    // 8: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/porssss-enhanced.png",
    // 9: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/image-298.png",
    // 10: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/image.png",
    // 11: "https://r2.fivemanage.com/KLOnVgD2IQV9YCjjepB5X/porssss-enhanced.png",
    // 12: "https://img.gta5-mods.com/q85-w800/images/bloods-crips-pants-mp-male/680c5e-22222.PNG",
    // 13: "https://mir-s3-cdn-cf.behance.net/projects/404/af8332165282565.Y3JvcCwxNzQ1LDEzNjUsNDA2LDA.png",
    // 14: "https://i.pinimg.com/736x/0e/e1/76/0ee1764527f0f15e6c1ba7cfbcd87ad8.jpg",
    // 15: "https://img.gta5-mods.com/q85-w800/images/bloods-crips-pants-mp-male/680c5e-22222.PNG",
};

// Music configuration - supports direct MP4 (video) and MP3 (audio) URLs
// You can use:
// - Direct MP4 links (will play video and audio): "https://r2.fivemanage.com/your-file.mp4"
// - Direct MP3 links (audio only): "https://r2.fivemanage.com/your-file.mp3"
// - Local files from config/music folder: "../config/music/song.mp3"
//
// THUMBNAILS: For MP4 videos, thumbnails are automatically extracted from the video!
// For MP3 files, you can optionally provide a thumbnail URL.
Config.Musics = {
    1: {
        url: "../config/music/ROCKIN.mp4",
        title: "ROCKIN",
        artist: "Shoreline Mafia, OHGEESY & Fenix Flexin",
    },
    2: {
        url: "../config/music/MaskOff.mp4",
        title: "Mask Off",
        artist: "Future",
    },
    3: {
        url: "../config/music/Inthatgear.mp4",
        title: "In That Gear",
        artist: "LilMarty400",
    },
    4: {
        url: "https://r2.fivemanage.com/huTkYKHp3NYXdtq62xbx9/OhGeesy(ShorelineMafia)-BlameMeOfficialMusicVideo-OHGEESY(1080ph264youtube).mp4",
        title: "OhGeesy - Blame Me",
        artist: "ShorelineMafia",
        // thumbnail: "custom-url.jpg" // Optional: only needed if you want a custom thumbnail or for MP3 files
    },
    // Example with MP3 file (with custom thumbnail)
    // 2: {
    //     url: "https://r2.fivemanage.com/your-id/song.mp3",
    //     title: "Song Title",
    //     artist: "Artist Name",
    //     thumbnail: "https://your-thumbnail-url.jpg" // Recommended for MP3 files
    // },
    // Example with local MP4 file (thumbnail auto-extracted)
    // 3: {
    //     url: "../config/music/local-video.mp4",
    //     title: "Local Song",
    //     artist: "Local Artist"
    // }
};



Config.Keybinds = {
    ["E"]: "Horn",
    ["LSHIFT"]: "Sprint",
    ["T"]: "Chat",
    ["M"]: "Ragdoll",
    ["SPACE"]: "Jump"
}