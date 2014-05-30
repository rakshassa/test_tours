function hide(elem, elem2, unhide_elem) {
    
    document.getElementById(elem).style.display = 'none';
    document.getElementById(elem2).style.display = 'none';
    document.getElementById(unhide_elem).style.display = 'block';
}


function show(elem, elem2, unhide_elem) {
 document.getElementById(elem).style.display = 'block';
 document.getElementById(elem2).style.display = 'none';
 document.getElementById(unhide_elem).style.display = 'block';

}