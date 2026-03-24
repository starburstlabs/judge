require "spec_helper"

describe Judge::FormBuilder do

  let(:builder) do
    lookup_context = ActionView::LookupContext.new(ActionController::Base.view_paths)
    view = ActionView::Base.with_empty_template_cache.new(lookup_context, {}, nil)
    Judge::FormBuilder.new(:user, FactoryBot.build(:user), view, {})
  end
  let(:categories) do
    category = FactoryBot.build(:category)
    sport = FactoryBot.build(:sport)
    sport.disciplines << FactoryBot.build_list(:discipline, 3)
    category.sports << sport
    [category]
  end
  let(:expected) do
    /data\-validate=\"\[.+\]\"/
  end

  specify "#text_field" do
    builder.text_field(:name, :validate => true).should match expected
  end

  specify "#text_area" do
    builder.text_area(:bio, :validate => true).should match expected
  end

  specify "#password_field" do
    builder.password_field(:password, :validate => true).should match expected
  end

  specify "#check_box" do
    builder.check_box(:accepted, :validate => true).should match expected
  end

  specify "#radio_button" do
    builder.radio_button(:gender, "female", :validate => true).should match expected
  end

  specify "#select" do
    builder.select(:country, [["US", "US"], ["GB", "GB"]], :validate => true).should match expected
  end

  specify "#collection_select" do
    cs = builder.collection_select(:team_id, FactoryBot.create_list(:team, 5), :id, :name, :validate => true)
    cs.should match expected
  end

  specify "#grouped_collection_select" do
    gcs = builder.grouped_collection_select(:discipline_id, categories, :sports, :name, :id, :name, :validate => true)
    gcs.should match expected
  end

  specify "#date_select" do
    builder.date_select(:dob, :validate => true, :minute_step => 30).should match expected
  end

  specify "#datetime_select" do
    builder.datetime_select(:dob, :validate => true, :minute_step => 30).should match expected
  end

  specify "#time_select" do
    builder.time_select(:dob, :validate => true, :minute_step => 30).should match expected
  end

  specify "#time_zone_select" do
    tzs = builder.time_zone_select(:time_zone, ActiveSupport::TimeZone.us_zones, :include_blank => true, :validate => true)
    tzs.should match expected
  end

  specify "#email_field" do
    builder.email_field(:username, :validate => true).should match expected
  end

  specify "#telephone_field" do
    builder.telephone_field(:telephone, :validate => true).should match expected
  end
end
