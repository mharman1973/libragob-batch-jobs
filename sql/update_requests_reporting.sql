SELECT date_trunc('hour',CREATED_DATE) as "Day",count(*) as "COUNTupdates",sum(number_of_table_updates) as "SUMnumber_of_table_updates" from public.update_requests
where created_date > current_date
group by date_trunc('hour',CREATED_DATE)
order by 1 desc;