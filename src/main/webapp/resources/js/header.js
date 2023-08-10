function showDropdown() {
    const dropdown = document.querySelector('.dropdown');
    dropdown.classList.add('show-content');
}

function hideDropdown() {
    const dropdown = document.querySelector('.dropdown');
    dropdown.classList.remove('show-content');
}

function innerHideDropdown() {
    const innerDropdown = document.querySelector('.inner-dropdown-content');
    innerDropdown.classList.remove('show-content')
}

function showInnerDropdown(target) {
    // 모든 inner-dropdown-content 숨기기
    const innerDropdowns = document.querySelectorAll('.inner-dropdown-content');
    innerDropdowns.forEach(item => item.classList.remove('show-content'));

    // 선택한 inner-dropdown에 대한 inner-dropdown-content 보여주기
    target.querySelector('.inner-dropdown-content').classList.add('show-content');
}

// 마우스가 드롭다운 영역에서 벗어날 때 숨기기
// document.querySelector('.dropdown').addEventListener('mouseleave', hideDropdown);
// document.querySelector('.inner-dropdown-content').addEventListener('mouseleave', hideDropdown);

