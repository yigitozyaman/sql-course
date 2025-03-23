DO $$
DECLARE
	r RECORD;
BEGIN
	FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public')
	LOOP

		EXECUTE 'DROP TABLE IF EXISTS public.' ||r.tablename|| ' CASCADE';
	END LOOP;
END $$;