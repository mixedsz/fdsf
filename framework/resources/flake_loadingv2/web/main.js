$(document).ready(function() {
    // Apply UI Color from config
    if (Config.UIColor) {
        const uiColor = `${Config.UIColor.r}, ${Config.UIColor.g}, ${Config.UIColor.b}`;
        document.documentElement.style.setProperty('--main-cock', uiColor);
    }

    // Global variables
    let discordLink = "https://discord.gg/fastscripts";
    let keyboardOpen = false;
    let totalSongs = 0;
    let currentSongIndex = 1;
    let isPlaying = true;
    let updateInterval;
    let musicPlayer = document.getElementById('music-player');

    // Initialize server name
    $(".servername h1").text(Config.ServerName.first);
    $(".servername h2").text(Config.ServerName.second);
    $(".accept h1").text(Config.SocialMedia.Discord.name);
    $(".accept h2").text(Config.SocialMedia.Discord.desc);
    discordLink = Config.SocialMedia.Discord.link;

    // Setup social media buttons dynamically
    for (const platform in Config.SocialMedia) {
        if (Object.prototype.hasOwnProperty.call(Config.SocialMedia, platform)) {
            const socialData = Config.SocialMedia[platform];
            const platformClass = `.${platform.toLowerCase()}`;

            // Check if the button exists in the HTML
            if ($(platformClass).length > 0) {
                $(platformClass).click(function() {
                    updateSocialMediaPopup(socialData);
                    $(platformClass).addClass("actived");
                });
            }
        }
    }

    function updateSocialMediaPopup(data) {
        $(".accept").animate({ top: "9.1979vw", opacity: "0" }, 250);
        setTimeout(() => {
            $(".babapro").removeClass("actived");
            discordLink = data.link;
            $(".accept h1").text(data.name);
            $(".accept h2").text(data.desc);
            $(".accept").animate({ top: "11.1979vw", opacity: "1" }, 250);
        }, 250);
    }

    // Setup rules section
    document.querySelector(".yazi").innerHTML = `
        <i class="fa-solid fa-image"></i>
        <h1>Rules</h1>
    `;

    let rulesHTML = "";
    for (const ruleNum in Config.Rules) {
        if (Object.prototype.hasOwnProperty.call(Config.Rules, ruleNum)) {
            rulesHTML += `
                <div class="ici rules">
                    <h1>Rule <strong>#${ruleNum}</strong></h1>
                    <h2>${Config.Rules[ruleNum]}</h2>
                </div>
            `;
        }
    }
    document.querySelector(".iciDolu").innerHTML = rulesHTML;

    // Tab switching (Rules, Team, Gallery)
    $(".siyahadam").click(function() {
        $(".rulesCon").animate({ right: "-2.0833vw", opacity: "0" }, 250);
        $(".iciDolu").removeClass("babapro31");
        
        const tabType = $(this).attr("data-test");
        
        if (tabType === "rulesCon") {
            document.querySelector(".yazi").innerHTML = `
                <i class="fa-solid fa-image"></i>
                <h1>Rules</h1>
            `;
            let content = "";
            for (const ruleNum in Config.Rules) {
                if (Object.prototype.hasOwnProperty.call(Config.Rules, ruleNum)) {
                    content += `
                        <div class="ici rules">
                            <h1>Rule <strong>#${ruleNum}</strong></h1>
                            <h2>${Config.Rules[ruleNum]}</h2>
                        </div>
                    `;
                }
            }
            document.querySelector(".iciDolu").innerHTML = content;
        } else if (tabType === "teamCon") {
            document.querySelector(".yazi").innerHTML = `
                <i class="fa-solid fa-users"></i>
                <h1>Admin Team</h1>
            `;
            let content = "";
            for (const memberNum in Config.Team) {
                if (Object.prototype.hasOwnProperty.call(Config.Team, memberNum)) {
                    const member = Config.Team[memberNum];
                    content += `
                        <div class="ici maac">
                            <h1>${member.name}</h1>
                            <div class="attre1">${member.rank}</div>
                            <div class="attre2">${member.desc}</div>
                            <img class="img" src="../config/${member.img}" alt="">
                        </div>
                    `;
                }
            }
            document.querySelector(".iciDolu").innerHTML = content;
        } else if (tabType === "galCon") {
            document.querySelector(".yazi").innerHTML = `
                <i class="fa-solid fa-image"></i>
                <h1>Server Gallery</h1>
            `;
            let content = "";
            for (const imgNum in Config.Gallery) {
                if (Object.prototype.hasOwnProperty.call(Config.Gallery, imgNum)) {
                    content += `
                        <div class="maa31c">
                            <img id="awd${imgNum}" class="img" src="${Config.Gallery[imgNum]}" alt="">
                        </div>
                    `;
                }
            }
            $(".iciDolu").addClass("babapro31");
            document.querySelector(".iciDolu").innerHTML = content;
            
            // Gallery image click handler
            $(".maa31c .img").click(function() {
                $("#bababurada").attr("src", $(this).attr("src"));
                $(".gizle").css("display", "flex");
                $(".gizle").animate({ opacity: "1" }, 250);
            });
        }
        
        setTimeout(() => {
            $(".siyahadam").removeClass("actived");
            $(this).addClass("actived");
            $(".rulesCon").animate({ right: "2.0833vw", opacity: "1" }, 250);
        }, 250);
    });

    // Close image viewer with Escape key
    document.addEventListener("keydown", function(e) {
        if (e.key === "Escape") {
            $(".gizle").animate({ opacity: "0" }, 250);
            setTimeout(() => {
                $(".gizle").css("display", "none");
            }, 250);
        }
    });

    // Close image viewer button
    $(".kapatamk").click(function() {
        $(".gizle").animate({ opacity: "0" }, 250);
        setTimeout(() => {
            $(".gizle").css("display", "none");
        }, 250);
    });

    // Social media popup buttons
    $(".cancel").click(function() {
        $(".babapro").removeClass("actived");
        $(".accept").animate({ top: "9.1979vw", opacity: "0" }, 250);
    });

    $(".go").click(function() {
        $(".babapro").removeClass("actived");
        $(".accept").animate({ top: "9.1979vw", opacity: "0" }, 250);
        window.invokeNative("openUrl", discordLink);
    });

    // Close all button
    $(".closeAll").click(function() {
        $(".siyahadam").removeClass("actived");
        $(".rulesCon").animate({ right: "-2.0833vw", opacity: "0" }, 250);
        $(".iciDolu").removeClass("babapro31");
        $(".gizle").animate({ opacity: "0" }, 250);
        setTimeout(() => {
            $(".gizle").css("display", "none");
        }, 250);
        $(".babapro").removeClass("actived");
        $(".accept").animate({ top: "9.1979vw", opacity: "0" }, 250);
        keyboardOpen = false;
        $(".keyboardfunc").animate({ left: "-2.0833vw", opacity: "0" }, 250);
        setTimeout(() => {
            $(".keyboardfunc").css("display", "none");
        }, 250);
    });

    // Keyboard shortcuts toggle
    $(".keyboard").click(function() {
        if (keyboardOpen) {
            keyboardOpen = false;
            $(".keyboardfunc").animate({ left: "-2.0833vw", opacity: "0" }, 250);
            setTimeout(() => {
                $(".keyboardfunc").css("display", "none");
            }, 250);
        } else {
            keyboardOpen = true;
            $(".keyboardfunc").css("display", "flex");
            $(".keyboardfunc").animate({ left: "2.0833vw", opacity: "1" }, 250);
        }
    });

    // Highlight keybinds
    $(".keyboardfunc rect").each(function() {
        const $rect = $(this);
        const key = $rect.attr("data-key");
        if (key && Config.Keybinds && Config.Keybinds[key]) {
            $rect.attr("fill", "rgb(var(--main-cock))");
            $rect.attr("fill-opacity", "0.2");
        }
    });

    // Keybind hover tooltips
    $(".keyboardfunc rect").hover(
        function() {
            let key = "";
            if ($(this).attr("data-key")) {
                key = $(this).attr("data-key");
                if (Config.Keybinds[key]) {
                    $(".key-tooltip h1").text(key);
                    $(".key-tooltip h2").text(Config.Keybinds[key]);
                    $(".key-tooltip").css({
                        left: $(this).offset().left + $(this).width() / 2.5,
                        top: $(this).offset().top - 45,
                        display: "flex"
                    });
                    $(this).attr("fill", "rgb(var(--main-cock))");
                    $(this).attr("fill-opacity", "0.5");
                }
            }
        },
        function() {
            let key = "";
            if ($(this).attr("data-key")) {
                key = $(this).attr("data-key");
                if (Config.Keybinds[key]) {
                    $(this).attr("fill", "rgb(var(--main-cock))");
                    $(this).attr("fill-opacity", "0.2");
                }
            }
            $(".key-tooltip").hide();
        }
    );

    // Count total songs
    for (const songNum in Config.Musics) {
        if (Object.prototype.hasOwnProperty.call(Config.Musics, songNum)) {
            totalSongs++;
        }
    }

    // Music Player Functions
    function updateProgressBar(currentTime, duration) {
        const percentage = (currentTime / duration) * 100;
        $(".loadBar2").css("width", percentage + "%");
    }

    function setVolume(volume) {
        $("#volume").slider("value", volume * 100);
        if (musicPlayer) {
            musicPlayer.volume = volume;
        }
    }

    function isVideoFile(url) {
        return url.toLowerCase().endsWith('.mp4') ||
               url.toLowerCase().endsWith('.webm') ||
               url.toLowerCase().endsWith('.mov');
    }

    function loadSong(songIndex) {
        const songData = Config.Musics[songIndex];

        if (!songData) {
            console.error("Song not found at index:", songIndex);
            return;
        }

        // Update UI with song info
        $(".musicCon h1").text(songData.title || "Unknown Title");
        $(".musicCon h2").text(songData.artist || "Unknown Artist");

        // Check if it's a video file
        const isVideo = isVideoFile(songData.url);

        // Clear the background video container
        const videoBackground = $(".musicVideoBackground");
        videoBackground.empty();

        if (isVideo) {
            // Create video element for the background of the entire music player
            const videoHTML = `<video muted loop autoplay playsinline style="width: 100%; height: 100%; object-fit: cover;">
                <source src="${songData.url}" type="video/mp4">
            </video>`;
            videoBackground.append(videoHTML);
        } else {
            // For audio files, show thumbnail if provided
            if (songData.thumbnail) {
                const imgHTML = `<img src="${songData.thumbnail}" style="width: 100%; height: 100%; object-fit: cover;">`;
                videoBackground.append(imgHTML);
            }
        }

        // Load the media file into the audio player for sound
        if (musicPlayer) {
            musicPlayer.src = songData.url;
            musicPlayer.load();

            // Auto-play when loaded
            musicPlayer.addEventListener('loadeddata', function() {
                musicPlayer.play().catch(e => {
                    console.error("Playback error:", e);
                    // Try playing without autoplay restriction
                    setTimeout(() => {
                        musicPlayer.play().catch(err => console.error("Retry failed:", err));
                    }, 100);
                });
                isPlaying = true;
                document.getElementById("secondAction").innerHTML = '<img src="images/musicPlayed.svg" alt="" draggable="false">';
            }, { once: true });

            // Update progress bar and sync background video
            musicPlayer.addEventListener('timeupdate', function() {
                updateProgressBar(musicPlayer.currentTime, musicPlayer.duration);

                // Sync background video with audio if it's a video
                const backgroundVideo = $(".musicVideoBackground video");
                if (backgroundVideo.length > 0 && backgroundVideo[0]) {
                    const timeDiff = Math.abs(backgroundVideo[0].currentTime - musicPlayer.currentTime);
                    // Only sync if difference is more than 0.5 seconds to avoid constant adjustments
                    if (timeDiff > 0.5) {
                        backgroundVideo[0].currentTime = musicPlayer.currentTime;
                    }
                }
            });

            // Auto-play next song when current ends
            musicPlayer.addEventListener('ended', function() {
                playNextSong();
            });
        }
    }

    function playPreviousSong() {
        currentSongIndex = currentSongIndex - 1 <= 0 ? totalSongs : currentSongIndex - 1;
        loadSong(currentSongIndex);
    }

    function playNextSong() {
        currentSongIndex = currentSongIndex + 1 > totalSongs ? 1 : currentSongIndex + 1;
        loadSong(currentSongIndex);
    }

    function togglePlayPause() {
        const backgroundVideo = $(".musicVideoBackground video");

        if (isPlaying) {
            isPlaying = false;
            musicPlayer.pause();
            // Also pause the background video if it exists
            if (backgroundVideo.length > 0) {
                backgroundVideo[0].pause();
            }
            document.getElementById("secondAction").innerHTML = '<img src="images/musicStopped.svg" alt="" draggable="false">';
        } else {
            isPlaying = true;
            musicPlayer.play().catch(e => console.error("Playback error:", e));
            // Also play the background video if it exists
            if (backgroundVideo.length > 0) {
                backgroundVideo[0].play().catch(e => console.error("Video playback error:", e));
            }
            document.getElementById("secondAction").innerHTML = '<img src="images/musicPlayed.svg" alt="" draggable="false">';
        }
    }

    // Music player controls
    $(".loadBar2").parent().on("click", function(e) {
        if (musicPlayer && musicPlayer.duration) {
            const $bar = $(this);
            const clickPosition = (e.pageX - $bar.offset().left) / $bar.width() * 100;
            const duration = musicPlayer.duration;
            const newTime = (clickPosition / 100) * duration;
            musicPlayer.currentTime = newTime;
            updateProgressBar(newTime, duration);
        }
    });

    // Volume controls
    $(".volumeDownIcon").click(function() {
        setVolume(0);
    });

    $(".volumeUpIcon").click(function() {
        setVolume(1);
    });

    // Previous song button
    $(".firstAction").click(function() {
        playPreviousSong();
    });

    // Play/Pause button
    $(".secondAction").click(function() {
        togglePlayPause();
    });

    // Next song button
    $(".thirdAction").click(function() {
        playNextSong();
    });

    // Volume slider
    $("#volume").slider({
        min: 0,
        max: 100,
        value: 10,
        range: "min",
        slide: function(event, ui) {
            setVolume(ui.value / 100);
        }
    });

    // Loading progress from FiveM
    window.addEventListener("message", function(e) {
        if (e.data.eventName === "loadProgress") {
            const progress = (e.data.loadFraction * 100).toFixed(0);
            $(".loadBar").css("width", Number(progress));
            $(".loadBarCon h1").text(progress + "%");
        }
    });

    // Initialize first song
    loadSong(currentSongIndex);
    setVolume(0.1); // Set initial volume to 10%

    // Background Video/Image Setup
    if (Config.BackgroundVideo) {
        if (Config.UseYoutubeVideo) {
            // Use YouTube video for background
            $("#video-foreground").html(`
                <iframe id="youtube-player31" class="vid" src="https://www.youtube.com/embed/${Config.YoutubeVideoID}?enablejsapi=1&autoplay=1&loop=1&playlist=${Config.YoutubeVideoID}&mute=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
            `);
            document.getElementById("youtube-player31").style.transform = "scale(1.5)";
        } else {
            // Use local video for background
            $("#video-foreground").html(`
                <video loop muted autoplay id="backgroundvideo" class="vid">
                    <source src="../config/video/trailer.webm" type="video/webm">
                </video>
            `);
        }
    } else {
        // Use image carousel for background
        const imagePath = "../config/slide/";
        const imagePrefix = "background";
        const imageExtension = ".jpg";
        let currentImageIndex = 1;

        function loadNextImage() {
            const imageUrl = imagePath + imagePrefix + currentImageIndex + imageExtension;

            // Preload image to check if it exists
            const img = new Image();
            img.onload = function() {
                // Image exists, display it
                const $img = $("<img>", {
                    src: imageUrl,
                    class: "vid",
                    alt: "Image"
                });

                $("#video-foreground img").hide();
                $("#video-foreground").append($img);
                $img.hide().fadeIn(1000);
                currentImageIndex++;
            };

            img.onerror = function() {
                // Image doesn't exist, reset to first image
                currentImageIndex = 1;
                const resetUrl = imagePath + imagePrefix + currentImageIndex + imageExtension;
                const $img = $("<img>", {
                    src: resetUrl,
                    class: "vid",
                    alt: "Image"
                });

                $("#video-foreground img").hide();
                $("#video-foreground").append($img);
                $img.hide().fadeIn(1000);
            };

            img.src = imageUrl;
        }

        // Load first image
        loadNextImage();

        // Set interval to change images
        setInterval(loadNextImage, Config.UpdateCarouselTime * 1000);
    }
});

