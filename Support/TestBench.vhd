----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2017 04:56:31 PM
-- Design Name: 
-- Module Name: ssd_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--USE ieee.numeric_std.ALL;
library std;
use std.textio.all;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab4_seven_segment_display_tb is
--  Port ( );
end lab4_seven_segment_display_tb;

architecture Behavioral of lab4_seven_segment_display_tb is

component lab4_seven_segment_display
   port ( b : in  STD_LOGIC_VECTOR (15 downto 0);
				  pushbutton : in STD_LOGIC;
              cathode : out  STD_LOGIC_VECTOR (6 downto 0);
              anode : out  STD_LOGIC_VECTOR (3 downto 0);
              clk : in  STD_LOGIC);
   end component;
   
    signal b : STD_LOGIC_VECTOR (15 downto 0);
       signal pushbutton : STD_LOGIC;
      signal cathode : STD_LOGIC_VECTOR (6 downto 0);
      signal anode : STD_LOGIC_VECTOR (3 downto 0);
      signal clk : STD_LOGIC := '1';
  
      signal err_cnt_signal : INTEGER;
      signal second_input : STD_LOGIC := '0';
    
       type display_output is array (0 to 7) of STD_LOGIC_VECTOR (6 downto 0);
       type bin_type is array (0 to 7) of STD_LOGIC_VECTOR (15 downto 0);
       type error_type is array (0 to 7) of INTEGER;
		 type anodeSeen_type is array (0 to 3) OF STD_LOGIC_VECTOR (3 downto 0);

   
begin


   UUT: lab4_seven_segment_display port map(
		b => b, 
		pushbutton => pushbutton,
		cathode => cathode, 
		anode => anode, 
		clk => clk
   );

    clk_process :process
    begin
	   wait for 5 ns;
        clk <= not clk;
    end process;
    
-- *** Test Bench - User Defined Section ***
    tb : process (clk)
   	    variable b_input : bin_type := (others => (others=>'0'));

        variable err_cnt : INTEGER := 0;
        variable s : line;
        variable first_cycle : INTEGER := 0;
        variable input_index : INTEGER := 0;
        variable cathode0 : display_output := (others => (others=>'0'));
        variable cathode1 : display_output := (others => (others=>'0'));
        variable cathode2 : display_output := (others => (others=>'0'));
        variable cathode3 : display_output := (others => (others=>'0'));
        variable error_testcase : error_type := (others => 0);
        variable error_printed : INTEGER := 0;
		  variable cycle_number : INTEGER := 0;
		  variable verification_index : INTEGER := 0;
		  variable anodeSeen : anodeSeen_type := (others => (others=>'0'));
        
        begin
            -- b_input = (1234, 1001, 0204, E7A3, 5b6d, C89F, 9F35, FFFE)
            b_input := ("0001001000110100","0001000000000001","0000001000000100","1110011110100011","0101101101101101","1100100010011111","1001111100110101","1111111111111110");
            cathode3 :=  ("1111001","1111001","1000000","0000110","0010010","1000110","0010000","0001110");
            cathode2 :=  ("0100100","1000000","0100100","1111000","0000011","0000000","0001110","0001110");
            cathode1 :=  ("0110000","1000000","1000000","0001000","0000010","0010000","0110000","0001110");
            cathode0 :=  ("0011001","1111001","0011001","0110000","0100001","0001110","0010010","0000110");
            
      
            if ((clk'event and clk = '1') and input_index <= 7) then
                pushbutton <= '1';
                b <= b_input(input_index);
                
						-- initial check
                if(first_cycle = 0) then	
                    first_cycle := 1;
                    report "Spending 1 cycle (10ns) idle";
					 else	
							if(anode = "1110") then
									if(cathode /= cathode0(verification_index)) then
										 report "(1) Error in testcase" & integer'image(input_index+1);
										 error_testcase(verification_index) := 1;
									end if;    
							 elsif(anode = "1101") then
									if(cathode /= cathode1(verification_index)) then
										 report "(2) Error in testcase" & integer'image(input_index+1);
										 error_testcase(verification_index) := 1;
									end if;
							 elsif(anode = "1011") then
									if(cathode /= cathode2(verification_index)) then
										 report "(3) Error in testcase" & integer'image(input_index+1);
										 error_testcase(verification_index) := 1;										 
									end if;    
							 elsif(anode = "0111") then
									if(cathode /= cathode3(verification_index)) then
										 report "(4) Error in testcase" & integer'image(input_index+1);
										 error_testcase(verification_index) := 1;
									end if;
							 else
									report "(5) Error in testcase" & integer'image(input_index+1);
									error_testcase(verification_index) := 1;
							 end if;
							  anodeSeen(cycle_number mod 4) := anode;
							  if ( cycle_number > 0 and cycle_number mod 4 = 0 ) then
									if (not((anodeSeen(0) = "1110" or anodeSeen(0) = "1101" or anodeSeen(0) = "1011" or anodeSeen(0) = "0111")
										and (anodeSeen(1) = "1110" or anodeSeen(1) = "1101" or anodeSeen(1) = "1011" or anodeSeen(1) = "0111")
										and (anodeSeen(2) = "1110" or anodeSeen(2) = "1101" or anodeSeen(2) = "1011" or anodeSeen(2) = "0111")
										and (anodeSeen(3) = "1110" or anodeSeen(3) = "1101" or anodeSeen(3) = "1011" or anodeSeen(3) = "0111")
										)) then
											report "(6) unknown anode(s) seen in testcase" & integer'image(input_index+1);
											error_testcase(verification_index) := 1;
									end if;
									if ( anodeSeen(0) = anodeSeen(1) or anodeSeen(0) = anodeSeen(2) or  anodeSeen(0) = anodeSeen(3)
											or anodeSeen(1) = anodeSeen(2) or anodeSeen(1) = anodeSeen(3) or anodeSeen(2) = anodeSeen(3) )
											then
											report "(7) not all anodes seen in testcase" & integer'image(input_index+1);
											error_testcase(verification_index) := 1;
									end if;											
								end if;
						end if;

            if(cycle_number = 31 and error_printed = 0) then
							report "printing errors";
                     for i in 0 to error_testcase'LENGTH-1 loop
								err_cnt := err_cnt + error_testcase(i);									
                     end loop;
                     report "err_cnt is " & integer'image(err_cnt);
                     err_cnt_signal <= err_cnt; 
                     -- summary of all the tests
                     if (err_cnt=0) then
								assert false
								report "Testbench of Lab 4 completed successfully!"
								severity note;
                     else
								assert false
                        report "Something wrong, try again"
                        severity error;
                     end if;
                     error_printed := 1;
            end if;
				cycle_number := cycle_number + 1;
				input_index := cycle_number / 4;
				verification_index := (cycle_number - 1) / 4;
        end if;      
    end process;        
end Behavioral;