require "spec_helper"

feature "Admin - Suppliers", js: true do

  before do
    country = create(:country, name: "United States")
    create(:state, name: "Vermont", country: country)
    @supplier = create :supplier
  end

  context "as an Admin" do

    before do
      login_user create(:admin_user)
      visit spree.admin_path
      within "ul[data-hook=admin_tabs]" do
        click_link "Suppliers"
      end
      page.should have_content("Listing Suppliers")
    end

    scenario "should be able to create new supplier" do
      click_link "New Supplier"
      check "supplier_active"
      fill_in "supplier[name]", with: "Test Supplier"
      fill_in "supplier[email]", with: "spree@example.com"
      fill_in "supplier[url]", with: "http://www.test.com"
      fill_in "supplier[commission_flat_rate]", with: "0"
      fill_in "supplier[commission_percentage]", with: "0"
      fill_in "supplier[address_attributes][firstname]", with: "First"
      fill_in "supplier[address_attributes][lastname]", with: "Last"
      fill_in "supplier[address_attributes][address1]", with: "1 Test Drive"
      fill_in "supplier[address_attributes][city]", with: "Test City"
      fill_in "supplier[address_attributes][zipcode]", with: "55555"
      select2 "United States", from: "Country"
      select2 "Vermont", from: "State"
      fill_in "supplier[address_attributes][phone]", with: "555-555-5555"
      click_button "Create"
      page.should have_content('Supplier "Test Supplier" has been successfully created!')
    end

  end
end
