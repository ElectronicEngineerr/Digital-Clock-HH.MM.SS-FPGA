library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;



entity digital_clock is

		port ( 
					clk 		: 		in std_logic;
					reset 		: 		in std_logic;
					---------------------------------
					hour_counter 		: 		out std_logic_vector ( 4 downto 0 );
					minute_counter 		:  		out std_logic_vector ( 5 downto 0 );
					second_counter 		: 		out std_logic_vector ( 5 downto 0 )
			 );	
end entity;

architecture Behavioral of digital_clock is

-- DEFINATIONS INTERNAL SIGNALs

signal hour_counter_internal 	: unsigned ( 4 downto 0 ) := ( others => '0' );
signal minute_counter_internal 	: unsigned ( 5 downto 0 ) := ( others => '0' );
signal second_counter_internal : unsigned  ( 5 downto 0 ) := ( others => '0' );



begin
-------------------------------------------

-- DIGITAL CLOCK CONFIGURATION
------------------------------------------------------------------

process ( reset, clk)
	begin
		
		if ( reset = '1') then
			
			hour_counter_internal 	<= ( others => '0' );
			minute_counter_internal	<= ( others => '0' );
			second_counter_internal <= ( others => '0' );
			
		elsif (rising_edge(clk)) then

				if (second_counter_internal < 59 ) then
					second_counter_internal <= second_counter_internal + 1; 
					
				else
					second_counter_internal <= (others => '0');
					
						if ( minute_counter_internal < 59) then
							minute_counter_internal <= minute_counter_internal + 1;
							
						else
							minute_counter_internal <= (others => '0');
							
								if ( hour_counter_internal < 23 ) then
									hour_counter_internal <=  hour_counter_internal + 1;
								else
									hour_counter_internal <= (others => '0');
								end if;
							
						end if;			
					
				end if;	
		end if;

end process;
------------------------------------------------------------------
hour_counter   <= std_logic_vector ( hour_counter_internal );
minute_counter <= std_logic_vector ( minute_counter_internal );
second_counter <= std_logic_vector ( second_counter_internal );


end Behavioral;
