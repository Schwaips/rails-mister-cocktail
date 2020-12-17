
import Typed from 'typed.js';

var options = {
  strings: ['Choose among thebest cocktails', 'And create your own'],
  typeSpeed: 90,
  loop: true
};

var initTyped = () => { new Typed('.typed-strings', options) };

export { initTyped };
