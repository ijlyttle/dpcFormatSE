/* get    
 *
 */

// find the navbar_nav element
var elem_navbar_nav = document.getElementsByClassName("navbar-nav")[0];

// append "navbar-right" to the class
elem_navbar_nav.className = elem_navbar_nav.className.concat(" navbar-right");

// find the brand element
var elem_nav_brand = 
  document.getElementsByClassName("navbar")[0]
          .getElementsByClassName("navbar-brand")[0];

var node = document.getElementById("se_logo_white");   
node.className = node.className.concat(" pull-left");

// append the node to the brand element
elem_nav_brand.appendChild(node);     