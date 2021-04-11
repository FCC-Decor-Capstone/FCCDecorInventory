/**
 * Confirm before Client side redirect
 */
function confirmGo(msg,url) {
    if ( confirm(msg) ) {
        window.location = url;
    }
}
/*
	Dynamically Append Error Messages
*/
const appendError = (controlName, innerHTML) => {
	 	
			 var controlElement = document.getElementById(controlName);
			 var span = document.createElement("span");
			 span.innerHTML = innerHTML;
			 controlElement.parentNode.insertBefore( span, controlElement.nextSibling );
 		}
	
/*
	Insert Top Corner Message
*/ 
	 const insertMessage = (Message, ErrBoolean) => {
		 let msgobj = document.createElement("div");
         msgobj.setAttribute("id", "CtlMsg");
         if (!ErrBoolean) msgobj.setAttribute("class", "CtlMsg success"); else msgobj.setAttribute("class", "CtlMsg fail");
         msgobj.innerHTML = Message;
		 document.body.appendChild(msgobj);
		 removeSlowly("CtlMsg");
	 }
        

/*
	Fade Out Animation used mainly for Message
*/
	 const removeSlowly = controlName => {
		 	let obj = document.getElementById(controlName);
		 	obj.style.opacity =  1;
		 	setTimeout(() => {
		 		let fx = setInterval(() => {
		        	if (obj.style.opacity != 0) { 
		        		obj.style.opacity -=  0.1;
    				} else {
	    				clearInterval(fx);
			        	obj.remove();    
			        }
				}, 50);	
			}, 1000);     
	 } 
