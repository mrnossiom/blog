function getSystemThemePreference() {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
}

let currentTheme =
    localStorage.getItem("theme") ||
    document.documentElement.getAttribute("data-theme") ||
    getSystemThemePreference();

function setTheme(theme) {
    document.documentElement.setAttribute("data-theme", theme);
    currentTheme = theme;
    localStorage.setItem('theme', theme);
}

function switchTheme() {
    setTheme(currentTheme === 'dark' ? 'light' : 'dark', true);
}

window
    .matchMedia('(prefers-color-scheme: dark)')
    .addEventListener('change', (prefersDark) => { setTheme(prefersDark.matches ? 'dark' : 'light'); });

// Trigger once on load to set `data-theme` attribute
setTheme(currentTheme);

