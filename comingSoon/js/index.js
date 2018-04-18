(function() { // canvas header

  var width, height, largeHeader, canvas, ctx, circles, target, animateHeader = true;

  // Main
  initHeader();
  addListeners();

  function initHeader() {
    width = window.innerWidth;
    height = window.innerHeight;
    target = {
      x: 0,
      y: height
    };

    largeHeader = document.getElementById('large-header');
    largeHeader.style.height = height + 'px';

    canvas = document.getElementById('header-canvas');
    canvas.width = width;
    canvas.height = height;
    ctx = canvas.getContext('2d');

    // create particles
    circles = [];
    for (var x = 0; x < width * 0.5; x++) {
      var c = new Circle();
      circles.push(c);
    }
    animate();
  }

  // Event handling
  function addListeners() {
    window.addEventListener('scroll', scrollCheck);
    window.addEventListener('resize', resize);
  }

  function scrollCheck() {
    if (document.body.scrollTop > height) animateHeader = false;
    else animateHeader = true;
  }

  function resize() {
    width = window.innerWidth;
    height = window.innerHeight;
    largeHeader.style.height = height + 'px';
    canvas.width = width;
    canvas.height = height;
  }

  function animate() {
    if (animateHeader) {
      ctx.clearRect(0, 0, width, height);
      for (var i in circles) {
        circles[i].draw();
      }
    }
    requestAnimationFrame(animate);
  }

  // Canvas manipulation
  function Circle() {
    var _this = this;

    // constructor
    (function() {
      _this.pos = {};
      init();
      console.log(_this);
    })();

    function init() {
      _this.pos.x = Math.random() * width;
      _this.pos.y = height + Math.random() * 100;
      _this.alpha = 0.1 + Math.random() * 0.3;
      _this.scale = 0.1 + Math.random() * 0.3;
      _this.velocity = Math.random();
    }

    this.draw = function() {
      if (_this.alpha <= 0) {
        init();
      }
      _this.pos.y -= _this.velocity;
      _this.alpha -= 0.0001;
      ctx.beginPath();
      ctx.arc(_this.pos.x, _this.pos.y, _this.scale * 10, 0, 2 * Math.PI, false);
      ctx.fillStyle = 'rgba(255,255,255,' + _this.alpha + ')';
      ctx.fill();
    };
  }

})();

//Canvas feed-image header
(function canvas() {
  $.fn.thumbsAnimate = function(options) {
    if (!this.length) {
      return this;
    }
    var opts = $.extend(true, {}, $.fn.thumbsAnimate.defaults, options);
    this.each(function(index) {
      var $this = $(this);
      if ($this.data('thumbsAnim')) return true;
      $this.data('thumbsAnim', '1');
      var w, h, lH, cvs, cx, cles, tget, aNow = true;
      var W = $('.feed-image').width();
      var H = $('.feed-image').height();
      var $wrapper = $this.wrap('<div class="anim-wrapper"></div>').parent();
      var $canvas = $('<canvas class="anim" width="' + W + '" height="' + H + '"></canvas>').insertAfter($this).attr('width', $wrapper.width()).attr('height', $wrapper.height());

      w = $canvas.innerWidth();
      h = $canvas.innerHeight();
      tget = {
        x: 0,
        y: h
      };
      cx = $canvas[0].getContext('2d');

      var animate = function() {
        if (aNow) {
          cx.clearRect(0, 0, w, h);
          for (var i in cles) {
            cles[i].draw();
          }
        }
        requestAnimationFrame(animate);
      };

      var Circle = function() {
        var _this = this;
        var dir = opts.direction;
        if (dir == 'both' && Math.random() > 0.5) dir = 'up';
        // constructor
        (function() {
          _this.pos = {};
          init();
          //console.log(_this);
        })();

        function init() {
          _this.pos.x = Math.random() * w;
          if (dir == 'up')
            _this.pos.y = h + Math.random() * 100;
          else
            _this.pos.y = -Math.random() * 100;
          _this.alpha = 0.1 + Math.random() * parseFloat(opts.alpha);
          _this.scale = 0.1 + Math.random() * parseFloat(opts.size);
          _this.velocity = Math.random() * parseFloat(opts.speed);
        }

        this.draw = function() {

          if (_this.alpha <= 0 || _this.scale === 0 || (dir == 'up' && _this.pos.y < 0) || (dir == 'down' && _this.pos.y > h)) {
            init();
          }
          if (dir == 'up')
            _this.pos.y -= _this.velocity;
          else
            _this.pos.y += _this.velocity;

          _this.alpha -= parseFloat(opts.fading);
          _this.scale = Math.max(0, _this.scale - parseFloat(opts.scaling));
          cx.beginPath();
          cx.arc(_this.pos.x, _this.pos.y, _this.scale * 10, 0, 2 * Math.PI, false);
          cx.fillStyle = 'rgba(' + opts.color + ',' + _this.alpha + ')';
          cx.fill();
        };
      };

      // create particles
      cles = [];
      for (var x = 0; x < w * parseFloat(opts.density); x++) {
        var c = new Circle();
        cles.push(c);
      }
      animate();

      // scroll & resize listeners
      $(window).scroll(function(event) {
        if ($this.isOnScreen()) {
          //if (!animateNow) console.log('#'+index+' started');
          aNow = true;
        } else {
          //if (animateNow) console.log('#'+index+' stopped');
          aNow = false;
        }
      }).resize(function(event) {
        w = $canvas.innerWidth();
        h = $canvas.innerHeight();
      });

    });

    return this;
  };

  // default options
  $.fn.thumbsAnimate.defaults = {
    color: '255,255,255', // stick to this format
    alpha: '0.6',
    size: '0.6',
    speed: '1',
    fading: '0.005', // fade out per frame
    scaling: '0', // scale down per frame
    density: '0.5', // number of circles = width * density
    direction: 'up'
  };

  if (typeof $.fn.isOnScreen === 'undefined') {
    $.fn.isOnScreen = function() {

      var win = $(window);

      var viewport = {
        top: win.scrollTop(),
        left: win.scrollLeft()
      };
      viewport.right = viewport.left + win.width();
      viewport.bottom = viewport.top + win.height();

      var bounds = this.offset();
      bounds.right = bounds.left + this.outerWidth();
      bounds.bottom = bounds.top + this.outerHeight();

      return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));

    };
  }

  // Init plugin
  var opts = {
    speed: 1,
    density: 0.4,
    alpha: 0.6,
    size: 0.6,
    fading: 0.001, // fade out per frame
    direction: 'up' // up/down/both
  };
  $(window).load(function() {
    $('.feed-post-image').thumbsAnimate(opts);
  });

});