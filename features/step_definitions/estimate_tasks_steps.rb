Given(/^I am a student$/) do

  visit '/login'
  fill_in('user[email]', :with => 'rsaenz@gmail.com')
  fill_in('user[password]', :with => '1234')
  click_button('Iniciar sesion')
  page.should have_content('rsaenz@gmail.com')

end

Given(/^there is a task "(.*?)"$/) do |arg1|
  @task = Task.new
  @task.title = arg1
  @task.limit_date = '01-10-2014'
  @task.save
end

When(/^I do not fill any fields$/) do
  visit '/tasks/latest'
  page.all(:link, 'Estimar')[2].click
  click_button('Aceptar')
end

When(/^I only fill real time$/) do
  visit '/tasks/latest'
  page.all(:link, 'Estimar')[2].click
  fill_in('user_task[real_time]', :with => 20)
  click_button('Aceptar')
end

When(/^I only fill estimated time$/) do
  visit '/tasks/latest'
  page.all(:link, 'Estimar')[2].click
  fill_in('user_task[estimated_time]', :with => 21)
  click_button('Aceptar')
end

When(/^I fill estimated and real time$/) do
  visit '/tasks/latest'
  page.all(:link, 'Estimar')[3].click
  fill_in('user_task[estimated_time]', :with => 21)
  fill_in('user_task[real_time]', :with => 20)
  click_button('Aceptar')
end
