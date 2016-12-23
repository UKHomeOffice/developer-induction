head.ready("js.cookie.js", function () {
  Reveal.configure({
    "center": true,
    progress: true,
    history: true,
    showNotes: true,
    multiplex: {
      secret: Cookies.get("secret") || null,
      id: 'd6e0af17bc853141', // id, obtained from socket.io server
      url: 'https://reveal-js-multiplex-ccjbegmaii.now.sh' // Location of socket.io server
    },

  });
});
head.js("//cdn.rawgit.com/js-cookie/js-cookie/latest/src/js.cookie.js");
head.js("//cdn.rawgit.com/Gottox/reveal.js-ace/master/ace.js");
head.js("//cdn.socket.io/socket.io-1.3.5.js");
head.js("plugin/multiplex/master.js");
head.js("plugin/multiplex/client.js");
head.js("//cdn.rawgit.com/marcysutton/reveal-a11y/master/accessibility/helper.css");
head.js("//cdn.rawgit.com/marcysutton/reveal-a11y/master/accessibility/helper.js");
