#' A Voter File Function
#'
#' This function allows you to read your voter files
#' @param State What state voter file do you have?
#' @param filelocation Where are your files held?
#' @param filename What is your file called?
#' @examples
#' Voter_file(Florida, ~Documents/TylerVF, FloridaFiles)


Voter_file <- function(State, filelocation, filename) {
  if (State == "Georgia") {
    setwd(filelocation)
    Georgia = read.csv(file = filename, header = TRUE, sep = "|", quote = "", dec = ".", fill = TRUE, stringsAsFactors = FALSE)
    return(Georgia)
  } else if (State == "Florida") {
    setwd(filelocation)
    file_list <- list.files(filelocation)
    readcolumns = c("character", "character", "character", "NULL", "character", "character", "character", "character", "character", "character",
                    "NULL", "character", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "character", "numeric", "character", "character",
                    "character", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")


    for (file in file_list) {

      # if the merged dataset doesn't exist, create it
      if (!exists("FLDataset")) {
        FLDataset <- read.csv(file, header = FALSE, colClasses = readcolumns, sep = "\t", dec = ".", fill = TRUE, quote = "")
      }

      # if the merged dataset does exist, append to it
      if (exists("FLDataset")) {
        temp_dataset <- read.csv(file, header = FALSE, colClasses = readcolumns, sep = "\t", dec = ".", fill = TRUE, quote = "")
        FLDataset <- rbind(FLDataset, temp_dataset)
        rm(temp_dataset)
      }

    }
    colnames(FLDataset) <- c("county", "state_voter_ID", "last_name", "first_name", "middle_name", "address1", "address2", "address3",
                             "city", "zip_code", "gender", "race", "date_of_registration", "birth_date", "party")

    return(FLDataset)
  }
  else if (State == "Colorado"){
    file_list <- list.files(filelocation)
    readcols <- c("character", "character", "character", "character", "character", "NULL", "character", "NULL", "NULL", "NULL", "NULL", "character",
                  "NULL", "NULL", "character", "character", "NULL", "NULL", "character", "character", "character", "character", "character", rep("NULL",
                                                                                                                                                 9), "character", "character", "character", "character", rep("NULL", 115))

    for (file in file_list) {

      # if the merged dataset doesn't exist, create it
      if (!exists("dataset")) {
        dataset <- read.csv(file, header = TRUE, colClasses = readcols)

      }

      # if the merged dataset does exist, append to it
      if (exists("dataset")) {
        temp_dataset <- read.csv(file, header = TRUE, colClasses = readcols)

        dataset <- rbind(dataset, temp_dataset)
        rm(temp_dataset)
      }

    }

    colnames(dataset) <- c("state_voter_ID", "county", "first_name", "middle_name", "last_name", "date_of_registration", "address1", "address2",
                           "address3", "address4", "address5", "city", "state", "zip_code", "voter_status", "party", "gender", "birth_date")
    dataset$state <- "Colorado"
    return(dataset)
  }
  else if (State == "Kansas"){
    setwd(filelocation)
    readcols = c("county", "cde_name_title", "first_name", "middle_name", "last_name", "cde_name_suffix", "birth_date", "registration_date",
                 "gender", "state_voter_ID", "address1", "pointless", "address2", "address3", "address4", "cde_street_dir_suffix", "cde_res_unit_type",
                 "text_res_unit_nbr", "city", "state", "zip_code", "text_res_zip4", "text_res_carrier_rte", "ind_res_military", "ind_res_military",
                 "text_mail_address1", "text_mail_address2", "text_mail_address3", "text_mail_address4", "text_mail_city", "cde_mail_state", "text_mail_zip5",
                 "text_mail_zip4", "text_mail_carrier_rte", "ind_mail_military", "ind_mail_foreign", "party", "precinct_text_name", "precinct_text_designation",
                 "text_phone_area_code", "text_phone_exchange", "text_phone_last_four", "text_election_code_1", "text_election_code_2", "text_election_code_3",
                 "text_election_code_4", "text_election_code_5", "text_election_code_6", "text_election_code_7", "text_election_code_8", "text_election_code_9",
                 "text_election_code_10", "cde_party", "ind_qualified", "text_res_physical_address", "district_cc", "district_cg", "district_jd", "district_kr",
                 "district_ks", "district_sb", "district_pt", "polling_place_text_name", "polling_place_text_address1", "polling_place_text_address2",
                 "polling_place_text_address3", "polling_place_text_address4", "polling_place_text_city", "polling_place_cde_state", "polling_place_text_zip5",
                 "polling_place_text_zip4", "district_sd")
    readcolumns = c("character", "NULL", "character", "character", "character", "NULL", "character", "character", "character", "character",
                    "character", "NULL", "character", "character", "character", "NULL", "NULL", "NULL", "character", "character", "character", "NULL",
                    "NULL", "NULL", rep("NULL", 13), "character", rep("NULL", 34))
    Kansas = read.table(file = filename, header = FALSE, fill = TRUE, col.names = readcols, sep = "\t")
    Kansas = Kansas[-1, ]
    Kansas$state <- "Kansas"
    return(Kansas)
  }
  else if (State == "Kentucky"){
    setwd(filelocation)
    Kentucky <- read.table(file = filename, fill = TRUE, sep = "\t", header = TRUE)
    return(Kentucky)
  }
  else if (State == "NY"){
    setwd(filelocation)
    nycolumns = c("Last_name", "First_name", "Middle_name", "Name_suffix", "Residence_house_number", "Residence_fractional_address", "Residence_apartment",
                  "Residence_Pre_street_direction", "Residence_street_name", "Residence_post_street_direction", "Residence_City", "Residence_Zip_Code_5",
                  "Zip_code_plus_4", "Mailing_Address_1", "Mailing_Address_2", "Mailing_Address_3", "Mailing_Address_4", "Date_of_birth", "Gender", "Political_party",
                  "Other_party", "County_code", "Election_district", "Legislative_district", "Town_City", "Ward", "Congressional_district", "Senate_district",
                  "Assembly_district", "Last_date_voted", "Last_year_voted", "Last_county_voted_in", "Last_registered_address", "Last_registered_name(if_different)",
                  "County_voter_registration_number", "registration_application_date", "registration_application_source", "identification_required_flag",
                  "identification_verification_requirement_met_flag", "Voter_status", "Status_Reason_codes", "Inactive_date_character", "Purge_date_character",
                  "Unique_NYS_Voter_ID", "VoterHistory")
    New_York <- read.table(file = filename, col.names = nycolumns, fill = T, sep = ",", header = F)
    return(New_York)
  }
  else if (State == "Pennsylvania"){
    setwd(filelocation)
    file_list <- list.files(filelocation)
    readcols = c("character", "NULL", "character", "character", "character", "NULL", "character", "character", "character", "character", "NULL",
                 "character", "character", "character", "character", "character", "character", "character", "character", "character", "NULL", "NULL",
                 "NULL", "NULL", "NULL", "NULL", "NULL", rep("NULL", 126))
    for (file1 in file_list) {

      # if the merged dataset doesn't exijst, create it
      if (((!exists("Pennsylvania")) & ((file.info(file1)$size > 1000)))) {
        Pennsylvania <- read.table(file1, colClasses = readcols, header = FALSE, sep = "\t", fill = T, quote = "\"")
        x <- strsplit(file1, " ")[[1]]
        Pennsylvania$county <- x[1]
      }

      # if the merged dataset does exist, append to it
      if ((exists("Pennsylvania") & (file.info(file1)$size > 1000))) {
        temp_dataset <- read.table(file1, colClasses = readcols, header = FALSE, sep = "\t", fill = T, quote = "\"")
        x <- strsplit(file1, " ")[[1]]
        temp_dataset$county <- x[1]
        Pennsylvania <- rbind(Pennsylvania, temp_dataset)
        rm(temp_dataset)
      }

    }
    Pennnames <- c("state_voter_ID", "last_name", "first_name", "middle_name", "gender", "birth_date", "date_of_registration", "voter_status",
                   "party", "address1", "address2", "address3", "address4", "address5", "city", "state", "zip_code", "county")
    colnames(Pennsylvania) <- Pennnames
    Pennsylvania$state <- "Pennsylvania"
    Pennsylvania$race <- NA
    Pennsylvania <- Pennsylvania[, order(colnames(Pennsylvania))]
    return(Pennsylvania)
  }




}

