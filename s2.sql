use ap

delimiter //

create PROCEDURE test()
begin 
	declare max_invoice_total decimal(9, 2);
    declare min_invoice_total decimal(9, 2);
    declare percent_difference decimal(9, 4);
    declare count_invoice_id INT;
    declare vendor_id_var INT;
    
    set vendor_id_var = 95;
    select max(invoice_total), min(invoice_total), count(invoice_id)
    INTO max_invoice_total, min_invoice_total, count_invoice_id
    from invocies where vendor_id = vendor_id_var;
    
    set percent_difference = (max_invoice_total - min_invoice_total) / min_invoice_total * 100;
    
    select concat('$', max_invoice_total) as 'Maximum invoice',
			concat('$', min_invoice_total) as 'Minimum invoice',
            concat('$', round(percent_difference, 2)) as 'Percent difference',
            count_invoice_id as 'Number of invoices';
END //

