$(function() {
  $("#film_person_tokens").tokenInput("/people.json", {
    crossDomain: false,
    prePopulate: $("#film_person_tokens").data("pre"),
    theme: 'facebook',
    hintText: 'Введите имя актера',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});