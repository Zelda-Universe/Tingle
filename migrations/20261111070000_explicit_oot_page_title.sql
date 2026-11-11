UPDATE `container` SET page_title='Ocarina of Time Remake'
WHERE LOWER(short_name)='ootr' AND (page_title IS NULL OR page_title='');
