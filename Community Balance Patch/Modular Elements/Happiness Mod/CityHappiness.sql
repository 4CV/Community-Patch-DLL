
	UPDATE Defines
	SET Value = '50'
	WHERE Name = 'BALANCE_HAPPINESS_THRESHOLD_PERCENTILE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

	-- DEFINES FOR CITY HAPPINESS
	
	UPDATE Defines
	SET Value = '0'
	WHERE Name = 'UNHAPPINESS_PER_POPULATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

	UPDATE Defines
	SET Value = '1.00'
	WHERE Name = 'UNHAPPINESS_PER_OCCUPIED_POPULATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

	-- Puppets produce flat unhappines based on # of citizens in the city. Divisor is this, never set to zero.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_HAPPINESS_PUPPET_THRESHOLD_MOD', '3'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );
		
	UPDATE Defines
	SET Value = '0'
	WHERE Name = 'UNHAPPINESS_PER_CITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

	UPDATE Defines
	SET Value = '0'
	WHERE Name = 'UNHAPPINESS_PER_CAPTURED_CITY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- 34 = 0.34 unhappiness per specialist.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPINESS_PER_SPECIALIST', '34'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Base Modifier for Capital Thresholds. Offsets boost from Palace, helps make Capital a source of Unhappiness early on. 34% is default.
		INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_HAPPINESS_CAPITAL_MODIFIER', '25'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- 	Base Value of Test - Modifier to tech % above/below median (deviation). 100 is default.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_HAPPINESS_TECH_BASE_MODIFIER', '100'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Base increase of threshold values based on # of citizens in cities you own. Modifier increases as cities grow. 400 is default.

	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_HAPPINESS_POP_MULTIPLIER', '0'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );
	
-- Value by which pop based threshodl modifier is divided. Never set to zero.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPY_CITY_BASE_VALUE', '1'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Value by which yield/threshold difference for boredom is divded.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPY_CITY_BASE_VALUE_BOREDOM', '50'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Value by which yield/threshold difference is divded.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPY_CITY_BASE_VALUE_ILLITERACY', '50'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Value by which yield/threshold difference is divded.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPY_CITY_BASE_VALUE_DISORDER', '100'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Value by which yield/threshold difference is divded.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPY_CITY_BASE_VALUE_POVERTY', '50'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Unhappiness point per religious minority pop. A high faith to population ratio will reduce this penalty. Also note that this is the ONLY unhappiness calculation that goes down as the game progresses (religion makes slightly less unhappiness as you move into new eras)
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPINESS_PER_MINORITY_POP', '0.34'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Unhappiness point per starving citizen.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPINESS_FROM_STARVING_PER_POP', '1.0'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Unhappiness point per pillaged plot owned by city.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPINESS_PER_PILLAGED', '0.50'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Unhappiness point per pop if unconnected or blockaded.
	INSERT INTO Defines (
	Name, Value)
	SELECT 'BALANCE_UNHAPPINESS_FROM_UNCONNECTED_PER_POP', '0.25'
	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );


