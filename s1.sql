use ap;
drop procedure if exists test;
DELIMITER //
create procedure test()

BEGIN
	declare sum_balance_due_var decimal(9,2);
    select sum(invoice_total - payment_total - credit_total)
    into sum_balance_due_var
    from invoices
    where vendor_id = 95;
    
    IF sum_balance_due_var > 0 then
		select concat('Balance due: $', sum_balance_due_var) as message;
	ELSE
		select 'Balance paid in full' as message;
	END IF;
    
END//

DELIMITER ;

CALL test();

select * from vendors where vendor_id = 95;