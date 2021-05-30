document.addEventListener("DOMContentLoaded", themeChange);

// Check if dark mode was previously enabled (as soon as possible)
const currentTheme = localStorage.getItem("theme");
if (currentTheme) {
    document.documentElement.setAttribute("data-theme", currentTheme);
}

function themeChange(){
    // Select our toggle button
    let button = document.querySelector(".theme-toggle");

    // Add an event listener for a click
    button.addEventListener("click", function(e) {
        // Check the current data-theme value
        let currentTheme = document.documentElement.getAttribute("data-theme");
        let newTheme = currentTheme === "light" ? "dark" : "light";

        transition();
        document.documentElement.setAttribute("data-theme", newTheme);
        localStorage.setItem("theme", newTheme);
    });

    // Adds the 'transition' class to <html> for CSS fun
    let transition = () => {
        document.documentElement.classList.add("transition");
        window.setTimeout(() => {
            document.documentElement.classList.remove("transition");
        }, 1000);
    }
}
