// document.addEventListener("DOMContentLoaded", function() {
//     const navLinks = document.querySelectorAll("nav a");
//     const span = document.querySelector("nav span");
    
//     let totalWidth = 0;
//     navLinks.forEach(link => {
//         totalWidth += link.offsetWidth;
//     });
    
//     span.style.width = `${totalWidth / navLinks.length}px`;
    
//     navLinks.forEach((link, index) => {
//         link.addEventListener("mouseenter", function() {
//             span.style.left = `${index * (totalWidth / navLinks.length)}px`;
//         });
//     });
// });



//matches-start-hover-animation
// $(document).ready(function() {
//     $('.nav a').hover(function() {
//         $('.nav a').removeClass('initial');
//         $(this).addClass('initial');
//     });
// });


//dropdown-menu
const optionMenu = document.querySelector('.select-menu');
const selectBtn = optionMenu.querySelector('.select-btn');
const options = optionMenu.querySelectorAll('.option');
const sbtn_text = optionMenu.querySelector('.btn-txt');


selectBtn.addEventListener('click', () => {
    optionMenu.classList.toggle('active');
});

options.forEach(option => {
    option.addEventListener('click', () => {
        let selectedOption = option.querySelector('.option-text').innerText;
        sbtn_text.innerText=selectedOption;
        // console.log(selectedOption);

        optionMenu.classList.remove('active')
    });
    // console.log(option);
});
