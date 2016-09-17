function users_csv_to_json {
  awk -F';' '{print "\{\"first_name\":\""$1"\",\"last_name\":\""$2"\",\"email\":\""$3"\",\"addres1\":\""$4"\",\"address2\":\""$5"\",\"city\":\""$6"\",\"date_of_birth\":\""$7"\",\"password\":\""$8"\"\}"}'
}
