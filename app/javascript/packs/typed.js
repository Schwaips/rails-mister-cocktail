
import Typed from 'typed.js';

var options = {
  strings: ['Choose among thebest cocktails', 'Discover the best cocktails around the world and create your own'],
  typeSpeed: 90,
  loop: true
};

var initTyped = () => { new Typed('.typed-strings', options) };

export { initTyped };
