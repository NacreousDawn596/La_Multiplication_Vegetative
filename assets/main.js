window.addEventListener("load", function(event) {
    sections = document.getElementsByClassName("scroll");
    console.log(sections)
    n = 0
    console.log(sections[n])
    window.addEventListener('keydown', function(event) {
        switch(event.key){
            case 'ArrowUp':
                if (n != sections.length - 1 || n != 0){
                    sec = sections[n]
                    sec.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start',
                        inline: 'nearest'
                    });
                    n = n - 1
                }
                break;
            case 'ArrowDown':
                if (n != sections.length || n >= 0){
                    sec = sections[n]
                    sec.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start',
                        inline: 'nearest'
                    });
                    n = n + 1
                }
                break;
        }
    })
})