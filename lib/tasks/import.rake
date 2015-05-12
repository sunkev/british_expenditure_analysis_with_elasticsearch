data_mapping_hash = [
  {:Adjustment_identifier=>:adjustment_identifier}, {:Adjustment_type=>:adjustment_type}, {:Stage=>:stage},
  {:Title=>:title}, {:Account_code=>:account_code}, {:Account_description=>:account_description},
  {:Line_description=>:line_description}, {:Department_code=>:department_code},
  {:Department_description=>:department_description}, {:Time=>:time}, {:Counterparty_code=>:counterparty_code},
  {:Couterparty_description=>:couterparty_description}, {:Programme_object_code=>:programme_object_code},
  {:Programme_object_description=>:programme_object_description}, {:Data_type=>:data_type},
  {:Data_type_description=>:data_type_description}, {:Accounting_Authority=>:accounting_authority},
  {:Accounts_capital_current=>:accounts_capital_current}, {:Activity_code=>:activity_code},
  {:Budget_Boundary=>:budget_boundary}, {:Budget_capital_current=>:budget_capital_current},
  {:Resource_Capital=>:resource_capital}, {:Programme_admin=>:programme_admin}, {:CGA_Body_Type=>:cga_body_type},
  {:COFOG=>:cofog}, {:Dept_Group=>:dept_group}, {:Estimate_line=>:estimate_line}, {:ESA=>:esa},
  {:EU=>:eu}, {:Income_Category=>:income_category}, {:LG=>:lg}, {:LG_Body_Type=>:lg_body_type},
  {:Estimate_number=>:estimate_number}, {:Line=>:line},
  {:Line_last_year=>:line_last_year}, {:Line_next_year=>:line_next_year}, {:NAC=>:nac},
  {:NHS_Body_Type=>:nhs_body_type}, {:OCS=>:ocs},
  {:PC_Body_Type=>:pc_body_type}, {:PESA_1_1=>:pesa_1_1}, {:PESA_Current_Grants=>:pesa_current_grants},
  {:PESA_Delivery=>:pesa_delivery}, {:PESA_Services=>:pesa_services}, {:PESA_Transfer=>:pesa_transfer},
  {:Request_for_resources=>:request_for_resources}, {:Sector=>:sector}, {:SIGNAGE=>:signage},
  {:Territory=>:territory}, {:Cbal=>:cbal}, {:Local_Government_Use_only=>:local_government_use_only},
  {:Net_Subhead=>:net_subhead}, {:Non_ID_Exceptions=>:non_id_exceptions}, {:NotOCS=>:notocs},
  {:Obal=>:obal}, {:PESA_1_1_Nat_Lottery=>:pesa_1_1_nat_lottery}, {:PESA_1_1_Tax_Credits=>:pesa_1_1_tax_credits},
  {:PESA_1_2_NHS=>:pesa_1_2_nhs}, {:PESA_BBC=>:pesa_bbc}, {:PESA_STU_LOANS=>:pesa_stu_loans},
  {:Bad_Debts=>:bad_debts}, {'amount'=>:amount}
].reduce({}) {|h,pairs| pairs.each {|k,v| (h[k] ||= []) << v}; h}

task :populate_database => :environment do
  filename = Rails.root.join('lib','tasks','2012AdjustmentTableResult_2011-12.csv')

  f = File.open(filename, "r:bom|utf-8");

  options = {
    col_sep: "|", row_sep: "\n",
    key_mapping: data_mapping_hash,
    force_simple_split: true
  }

  n = SmarterCSV.process(f, options) do |array|
    # we're passing a block in, to process each resulting hash / =row (the block takes array of hashes)
    # when chunking is not enabled, there is only one hash in each array
      Organisation.create( array.first.except(:"cfer_income/receipts", :"cash items", :"cfer_resource/capital", :"gross/income", :"non-cash_items", :couterparty_description) )
  end

  f.close

end

# include ActiveSupport

