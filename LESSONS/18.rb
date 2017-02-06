Подключить к проекту аутентификацию через Devise
Разделить приложение на пользовательскую и административную части. В административную часть имеет доступ только пользователи с правами администратора.
При покупке билета, билет должен привязываться к купившему его пользователю (залогиненному), при этом, id пользователя не должен передаваться в параметрах запроса или полях формы, в т.ч. скрытых (используйте current_user в контроллере для этого)
Залогиненный пользователь может посмотреть список всех своих купленных билетов, каждый билет в отдельности, а также удалить билет (только из своих билетов)
Администратор может просматривать список всех билетов в системе, каждый в отдельности, редактировать билеты и удалять их.
Также администратор может создавать билеты для любого зарегистрированного пользователя, выбирая их из списка.
При регистрации пользователя запрашивать его имя и фамилию и после входа, выводить "Привет, <имя пользователя>!"
После успешного входа, перенаправлять обычных пользователей на страницу поиска билетов, а админов - на страницу, где перечислены ссылки на управление ресурсами приложения (статья из wiki devise: github.com:-Redirect-to-a-specific-page-on-successful-sign-in-and-sign-out).