head.ready("js.cookie.js", function () {
  Reveal.configure({
    center: true,
    progress: true,
    showNotes: true,
    multiplex: {
      secret: Cookies.get("secret") || null,
      id: '18ecd586df86ab45', // id, obtained from socket.io server
      url: 'https://reveal-js-multiplex-ccjbegmaii.now.sh' // Location of socket.io server
    }
  });
  Reveal.addEventListener('slidechanged', function (event) {
    var current_videos = event.currentSlide.getElementsByTagName("video");
    for (var i = 0; i < current_videos.length; i++) {
      current_videos[i].currentTime = 0;
      current_videos[i].play();
    }
    var previous_videos = event.previousSlide.getElementsByTagName("video");
    for (var i = 0; i < previous_videos.length; i++) {
      previous_videos[i].pause();
    }
  });
});
head.js("//cdn.rawgit.com/js-cookie/js-cookie/latest/src/js.cookie.js");
head.js("//cdn.rawgit.com/Gottox/reveal.js-ace/master/ace.js");
head.js("//cdn.socket.io/socket.io-1.3.5.js");
head.js("plugin/multiplex/master.js");
head.js("plugin/multiplex/client.js");
