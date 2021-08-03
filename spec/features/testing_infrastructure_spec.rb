feature 'Testing infrastructure' do
  scenario 'infrastructure working' do
    visit('/')
    expect(page).to have_content 'Hello'
  end
end