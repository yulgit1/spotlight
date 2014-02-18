require "spec_helper"

describe "Search Facets Administration" do
  let(:curator) { FactoryGirl.create(:exhibit_curator) }
  let(:exhibit) { Spotlight::Exhibit.default }
  before { login_as curator }
  describe "edit" do
    it "should display the facet edit screen" do
      visit spotlight.exhibit_edit_facets_path(exhibit)
      expect(page).to have_css("h2", text: "Search Facets")
      within("[data-id='genre_ssim']") do
        expect(page).to have_content("Genre")
        expect(page).to have_content("56 items")
        expect(page).to have_content("10 unique values")
      end
    end
  end
end