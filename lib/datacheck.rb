it 'should persist data that was saved' do
    @browser.text_field(:id, "fname").value.should eq(@config[:settings][:firstname])
    @browser.text_field(:id, "lname").value.should eq(@config[:settings][:lastname])
    @browser.text_field(:id, "descriptionInput").value.should eq(@config[:settings][:description])
    @browser.select_list(:id, "locationInput").value.should eq(@config[:settings][:location])
    @browser.text_field(:id, "emailaddress").value.should eq(@config[:settings][:email])
    @browser.text_field(:id, "ringduration").value.should eq(@config[:settings][:ringdur])
    @browser.select_list(:id, "mohInput").value.should eq(@config[:settings][:moh])
    @browser.text_field(:id, "externalCid").value.should eq(@config[:settings][:cid])
    @browser.text_field(:id, "calleridname").value.should eq(@config[:settings][:cidname])
    @browser.select_list(:id, "hidefromdir").value.should eq(@config[:settings][:hidefromdir])
    @browser.select_list(:id, "companyFaxNotifications").value.should eq(@config[:settings][:faxnotif])
    @browser.select_list(:id, "attachFaxFile").value.should eq(@config[:settings][:faxattach])
end