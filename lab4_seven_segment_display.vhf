--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 08/25/2017 19:18:36
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl lab4_seven_segment_display.vhf -w /home/btech/cs1160345/lab4_seven_segment_display/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FTC_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_lab4_seven_segment_display is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_lab4_seven_segment_display;

architecture Behavioral of FTC_HXILINX_lab4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL CB2RE_HXILINX_lab4_seven_segment_display -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2RE_HXILINX_lab4_seven_segment_display is
  port (
    CEO : out STD_LOGIC;
    Q0  : out STD_LOGIC;
    Q1  : out STD_LOGIC;
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    R   : in STD_LOGIC
    );
end CB2RE_HXILINX_lab4_seven_segment_display;

architecture CB2RE_HXILINX_lab4_seven_segment_display_V of CB2RE_HXILINX_lab4_seven_segment_display is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');

begin

process(C)
begin
  if (C'event and C ='1') then
    if (R='1') then
      COUNT <= (others => '0');
    elsif (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0'; 
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0'; 
Q1  <= COUNT(1);
Q0  <= COUNT(0);

end CB2RE_HXILINX_lab4_seven_segment_display_V;
----- CELL OR6_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR6_HXILINX_lab4_seven_segment_display is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic
  );
end OR6_HXILINX_lab4_seven_segment_display;

architecture OR6_HXILINX_lab4_seven_segment_display_V of OR6_HXILINX_lab4_seven_segment_display is
begin
  O <=  (I0 or I1 or I2 or I3 or I4 or I5);
end OR6_HXILINX_lab4_seven_segment_display_V;
----- CELL M4_1E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_lab4_seven_segment_display is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_lab4_seven_segment_display;

architecture M4_1E_HXILINX_lab4_seven_segment_display_V of M4_1E_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_lab4_seven_segment_display_V;
----- CELL D2_4E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_lab4_seven_segment_display is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_lab4_seven_segment_display;

architecture D2_4E_HXILINX_lab4_seven_segment_display_V of D2_4E_HXILINX_lab4_seven_segment_display is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_lab4_seven_segment_display_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity slowclk_MUSER_lab4_seven_segment_display is
   port ( XLXN_7  : in    std_logic; 
          XLXN_23 : out   std_logic);
end slowclk_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of slowclk_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_5  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   component FTC_HXILINX_lab4_seven_segment_display
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_2";
   attribute HU_SET of XLXI_8 : label is "XLXI_8_3";
begin
   XLXI_1 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_7,
                CLR=>XLXN_16,
                T=>XLXN_5,
                Q=>XLXN_8);
   
   XLXI_2 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_7,
                CLR=>XLXN_16,
                T=>XLXN_10,
                Q=>XLXN_11);
   
   XLXI_3 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_7,
                CLR=>XLXN_16,
                T=>XLXN_12,
                Q=>XLXN_21);
   
   XLXI_4 : AND2
      port map (I0=>XLXN_8,
                I1=>XLXN_5,
                O=>XLXN_10);
   
   XLXI_5 : AND2
      port map (I0=>XLXN_11,
                I1=>XLXN_10,
                O=>XLXN_12);
   
   XLXI_6 : VCC
      port map (P=>XLXN_16);
   
   XLXI_7 : VCC
      port map (P=>XLXN_5);
   
   XLXI_8 : FTC_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_7,
                CLR=>XLXN_16,
                T=>XLXN_22,
                Q=>XLXN_23);
   
   XLXI_9 : AND2
      port map (I0=>XLXN_21,
                I1=>XLXN_12,
                O=>XLXN_22);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity c2addr_MUSER_lab4_seven_segment_display is
   port ( Q1 : in    std_logic; 
          Q2 : in    std_logic; 
          Q3 : in    std_logic; 
          R1 : out   std_logic; 
          R2 : out   std_logic);
end c2addr_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of c2addr_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_2 : OR2
      port map (I0=>Q3,
                I1=>Q1,
                O=>R2);
   
   XLXI_3 : OR2
      port map (I0=>Q3,
                I1=>Q2,
                O=>R1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity rcounter_MUSER_lab4_seven_segment_display is
   port ( XLXN_40 : in    std_logic; 
          XLXN_36 : out   std_logic; 
          XLXN_37 : out   std_logic; 
          XLXN_38 : out   std_logic; 
          XLXN_39 : out   std_logic);
end rcounter_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of rcounter_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   component CB2RE_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component D2_4E_HXILINX_lab4_seven_segment_display
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_21 : label is "XLXI_21_4";
   attribute HU_SET of XLXI_22 : label is "XLXI_22_5";
begin
   XLXI_21 : CB2RE_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_40,
                CE=>XLXN_33,
                R=>XLXN_34,
                CEO=>open,
                Q0=>XLXN_29,
                Q1=>XLXN_30,
                TC=>open);
   
   XLXI_22 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_29,
                A1=>XLXN_30,
                E=>XLXN_35,
                D0=>XLXN_36,
                D1=>XLXN_37,
                D2=>XLXN_38,
                D3=>XLXN_39);
   
   XLXI_26 : VCC
      port map (P=>XLXN_33);
   
   XLXI_27 : GND
      port map (G=>XLXN_34);
   
   XLXI_28 : VCC
      port map (P=>XLXN_35);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity b27_MUSER_lab4_seven_segment_display is
   port ( a    : in    std_logic; 
          b    : in    std_logic; 
          c    : in    std_logic; 
          d    : in    std_logic; 
          Aout : out   std_logic; 
          Bout : out   std_logic; 
          Cout : out   std_logic; 
          Dout : out   std_logic; 
          Eout : out   std_logic; 
          Fout : out   std_logic; 
          Gout : out   std_logic);
end b27_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of b27_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_22 : std_logic;
   signal XLXN_23 : std_logic;
   signal XLXN_24 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_26 : std_logic;
   signal XLXN_27 : std_logic;
   signal XLXN_28 : std_logic;
   signal XLXN_29 : std_logic;
   signal XLXN_30 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_32 : std_logic;
   signal XLXN_33 : std_logic;
   signal XLXN_34 : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_36 : std_logic;
   signal XLXN_37 : std_logic;
   signal XLXN_38 : std_logic;
   signal XLXN_39 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_41 : std_logic;
   signal XLXN_42 : std_logic;
   signal XLXN_43 : std_logic;
   signal XLXN_44 : std_logic;
   signal XLXN_45 : std_logic;
   signal XLXN_46 : std_logic;
   signal XLXN_47 : std_logic;
   signal XLXN_48 : std_logic;
   component OR6_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_6";
begin
   XLXI_1 : OR6_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_19,
                I1=>XLXN_18,
                I2=>XLXN_17,
                I3=>XLXN_16,
                I4=>XLXN_15,
                I5=>XLXN_14,
                O=>Aout);
   
   XLXI_2 : AND2B2
      port map (I0=>d,
                I1=>b,
                O=>XLXN_14);
   
   XLXI_3 : AND2B1
      port map (I0=>a,
                I1=>c,
                O=>XLXN_15);
   
   XLXI_4 : AND2
      port map (I0=>c,
                I1=>b,
                O=>XLXN_16);
   
   XLXI_5 : AND2B1
      port map (I0=>d,
                I1=>a,
                O=>XLXN_17);
   
   XLXI_10 : AND3B1
      port map (I0=>a,
                I1=>d,
                I2=>b,
                O=>XLXN_18);
   
   XLXI_11 : AND3B2
      port map (I0=>c,
                I1=>b,
                I2=>a,
                O=>XLXN_19);
   
   XLXI_12 : OR5
      port map (I0=>XLXN_24,
                I1=>XLXN_23,
                I2=>XLXN_22,
                I3=>XLXN_21,
                I4=>XLXN_20,
                O=>Bout);
   
   XLXI_13 : AND2B2
      port map (I0=>b,
                I1=>a,
                O=>XLXN_20);
   
   XLXI_14 : AND2B2
      port map (I0=>d,
                I1=>b,
                O=>XLXN_21);
   
   XLXI_15 : AND3B3
      port map (I0=>d,
                I1=>c,
                I2=>a,
                O=>XLXN_22);
   
   XLXI_16 : AND3B1
      port map (I0=>a,
                I1=>d,
                I2=>c,
                O=>XLXN_23);
   
   XLXI_17 : AND3B1
      port map (I0=>c,
                I1=>d,
                I2=>a,
                O=>XLXN_24);
   
   XLXI_18 : OR5
      port map (I0=>XLXN_38,
                I1=>XLXN_37,
                I2=>XLXN_36,
                I3=>XLXN_35,
                I4=>XLXN_34,
                O=>Cout);
   
   XLXI_19 : AND2B2
      port map (I0=>c,
                I1=>a,
                O=>XLXN_34);
   
   XLXI_20 : AND2B1
      port map (I0=>a,
                I1=>d,
                O=>XLXN_35);
   
   XLXI_21 : AND2B1
      port map (I0=>c,
                I1=>d,
                O=>XLXN_36);
   
   XLXI_22 : AND2B1
      port map (I0=>a,
                I1=>b,
                O=>XLXN_37);
   
   XLXI_23 : AND2B1
      port map (I0=>b,
                I1=>a,
                O=>XLXN_38);
   
   XLXI_24 : OR5
      port map (I0=>XLXN_33,
                I1=>XLXN_32,
                I2=>XLXN_31,
                I3=>XLXN_30,
                I4=>XLXN_29,
                O=>Dout);
   
   XLXI_25 : AND2B1
      port map (I0=>c,
                I1=>a,
                O=>XLXN_29);
   
   XLXI_26 : AND3B3
      port map (I0=>d,
                I1=>b,
                I2=>a,
                O=>XLXN_30);
   
   XLXI_27 : AND3B1
      port map (I0=>b,
                I1=>d,
                I2=>c,
                O=>XLXN_31);
   
   XLXI_28 : AND3B1
      port map (I0=>c,
                I1=>d,
                I2=>b,
                O=>XLXN_32);
   
   XLXI_29 : AND3B1
      port map (I0=>d,
                I1=>c,
                I2=>b,
                O=>XLXN_33);
   
   XLXI_30 : OR4
      port map (I0=>XLXN_28,
                I1=>XLXN_27,
                I2=>XLXN_26,
                I3=>XLXN_25,
                O=>Eout);
   
   XLXI_32 : AND2
      port map (I0=>c,
                I1=>a,
                O=>XLXN_25);
   
   XLXI_33 : AND2
      port map (I0=>b,
                I1=>a,
                O=>XLXN_26);
   
   XLXI_34 : AND2B1
      port map (I0=>d,
                I1=>c,
                O=>XLXN_27);
   
   XLXI_35 : AND2B2
      port map (I0=>d,
                I1=>b,
                O=>XLXN_28);
   
   XLXI_36 : OR5
      port map (I0=>XLXN_43,
                I1=>XLXN_42,
                I2=>XLXN_41,
                I3=>XLXN_40,
                I4=>XLXN_39,
                O=>Fout);
   
   XLXI_37 : AND2B2
      port map (I0=>d,
                I1=>c,
                O=>XLXN_39);
   
   XLXI_38 : AND2B1
      port map (I0=>d,
                I1=>b,
                O=>XLXN_40);
   
   XLXI_39 : AND2B1
      port map (I0=>b,
                I1=>a,
                O=>XLXN_41);
   
   XLXI_40 : AND2
      port map (I0=>c,
                I1=>a,
                O=>XLXN_42);
   
   XLXI_41 : AND3B2
      port map (I0=>c,
                I1=>a,
                I2=>b,
                O=>XLXN_43);
   
   XLXI_42 : OR5
      port map (I0=>XLXN_48,
                I1=>XLXN_47,
                I2=>XLXN_46,
                I3=>XLXN_45,
                I4=>XLXN_44,
                O=>Gout);
   
   XLXI_43 : AND2B1
      port map (I0=>b,
                I1=>c,
                O=>XLXN_44);
   
   XLXI_44 : AND2B1
      port map (I0=>d,
                I1=>c,
                O=>XLXN_45);
   
   XLXI_45 : AND2B1
      port map (I0=>b,
                I1=>a,
                O=>XLXN_46);
   
   XLXI_46 : AND2
      port map (I0=>d,
                I1=>a,
                O=>XLXN_47);
   
   XLXI_47 : AND3B2
      port map (I0=>c,
                I1=>a,
                I2=>b,
                O=>XLXN_48);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4mux_MUSER_lab4_seven_segment_display is
   port ( b  : in    std_logic_vector (15 downto 0); 
          r0 : in    std_logic; 
          r1 : in    std_logic; 
          c0 : out   std_logic; 
          c1 : out   std_logic; 
          c2 : out   std_logic; 
          c3 : out   std_logic);
end lab4mux_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of lab4mux_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal XLXN_39 : std_logic;
   component M4_1E_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_7";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_8";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_9";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_10";
begin
   XLXN_39 <= '1';
   XLXI_1 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>b(0),
                D1=>b(4),
                D2=>b(8),
                D3=>b(12),
                E=>XLXN_39,
                S0=>r0,
                S1=>r1,
                O=>c0);
   
   XLXI_2 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>b(1),
                D1=>b(5),
                D2=>b(9),
                D3=>b(13),
                E=>XLXN_39,
                S0=>r0,
                S1=>r1,
                O=>c1);
   
   XLXI_3 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>b(2),
                D1=>b(6),
                D2=>b(10),
                D3=>b(14),
                E=>XLXN_39,
                S0=>r0,
                S1=>r1,
                O=>c2);
   
   XLXI_4 : M4_1E_HXILINX_lab4_seven_segment_display
      port map (D0=>b(3),
                D1=>b(7),
                D2=>b(11),
                D3=>b(15),
                E=>XLXN_39,
                S0=>r0,
                S1=>r1,
                O=>c3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_4     : std_logic;
   signal XLXN_5     : std_logic;
   signal XLXN_6     : std_logic;
   signal XLXN_7     : std_logic;
   signal XLXN_8     : std_logic;
   signal XLXN_9     : std_logic;
   signal XLXN_10    : std_logic;
   signal XLXN_84    : std_logic;
   signal XLXN_85    : std_logic;
   signal XLXN_86    : std_logic;
   signal XLXN_87    : std_logic;
   signal XLXN_88    : std_logic;
   signal XLXN_89    : std_logic;
   signal XLXN_90    : std_logic;
   signal XLXN_92    : std_logic;
   signal XLXN_93    : std_logic;
   signal XLXN_95    : std_logic;
   signal XLXN_100   : std_logic;
   signal XLXN_101   : std_logic;
   signal XLXN_102   : std_logic;
   signal XLXN_116   : std_logic;
   signal XLXN_119   : std_logic;
   signal XLXN_120   : std_logic;
   signal XLXN_121   : std_logic;
   component lab4mux_MUSER_lab4_seven_segment_display
      port ( b  : in    std_logic_vector (15 downto 0); 
             c0 : out   std_logic; 
             c1 : out   std_logic; 
             c2 : out   std_logic; 
             c3 : out   std_logic; 
             r0 : in    std_logic; 
             r1 : in    std_logic);
   end component;
   
   component b27_MUSER_lab4_seven_segment_display
      port ( a    : in    std_logic; 
             Aout : out   std_logic; 
             b    : in    std_logic; 
             Bout : out   std_logic; 
             c    : in    std_logic; 
             Cout : out   std_logic; 
             d    : in    std_logic; 
             Dout : out   std_logic; 
             Eout : out   std_logic; 
             Fout : out   std_logic; 
             Gout : out   std_logic);
   end component;
   
   component rcounter_MUSER_lab4_seven_segment_display
      port ( XLXN_36 : out   std_logic; 
             XLXN_37 : out   std_logic; 
             XLXN_38 : out   std_logic; 
             XLXN_39 : out   std_logic; 
             XLXN_40 : in    std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component c2addr_MUSER_lab4_seven_segment_display
      port ( Q1 : in    std_logic; 
             Q2 : in    std_logic; 
             Q3 : in    std_logic; 
             R1 : out   std_logic; 
             R2 : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component slowclk_MUSER_lab4_seven_segment_display
      port ( XLXN_23 : out   std_logic; 
             XLXN_7  : in    std_logic);
   end component;
   
begin
   XLXI_1 : lab4mux_MUSER_lab4_seven_segment_display
      port map (b(15 downto 0)=>b(15 downto 0),
                r0=>XLXN_93,
                r1=>XLXN_92,
                c0=>XLXN_7,
                c1=>XLXN_6,
                c2=>XLXN_5,
                c3=>XLXN_4);
   
   XLXI_4 : b27_MUSER_lab4_seven_segment_display
      port map (a=>XLXN_4,
                b=>XLXN_5,
                c=>XLXN_6,
                d=>XLXN_7,
                Aout=>XLXN_84,
                Bout=>XLXN_85,
                Cout=>XLXN_86,
                Dout=>XLXN_87,
                Eout=>XLXN_88,
                Fout=>XLXN_89,
                Gout=>XLXN_90);
   
   XLXI_5 : rcounter_MUSER_lab4_seven_segment_display
      port map (XLXN_40=>XLXN_10,
                XLXN_36=>XLXN_95,
                XLXN_37=>XLXN_100,
                XLXN_38=>XLXN_101,
                XLXN_39=>XLXN_102);
   
   XLXI_6 : AND2
      port map (I0=>pushbutton,
                I1=>clk,
                O=>XLXN_8);
   
   XLXI_7 : AND2B1
      port map (I0=>pushbutton,
                I1=>XLXN_121,
                O=>XLXN_9);
   
   XLXI_8 : OR2
      port map (I0=>XLXN_9,
                I1=>XLXN_8,
                O=>XLXN_10);
   
   XLXI_14 : c2addr_MUSER_lab4_seven_segment_display
      port map (Q1=>XLXN_100,
                Q2=>XLXN_101,
                Q3=>XLXN_102,
                R1=>XLXN_92,
                R2=>XLXN_93);
   
   XLXI_15 : INV
      port map (I=>XLXN_95,
                O=>anode(0));
   
   XLXI_16 : INV
      port map (I=>XLXN_100,
                O=>anode(1));
   
   XLXI_17 : INV
      port map (I=>XLXN_101,
                O=>anode(2));
   
   XLXI_19 : INV
      port map (I=>XLXN_102,
                O=>anode(3));
   
   XLXI_20 : INV
      port map (I=>XLXN_84,
                O=>cathode(0));
   
   XLXI_21 : INV
      port map (I=>XLXN_85,
                O=>cathode(1));
   
   XLXI_22 : INV
      port map (I=>XLXN_86,
                O=>cathode(2));
   
   XLXI_23 : INV
      port map (I=>XLXN_87,
                O=>cathode(3));
   
   XLXI_24 : INV
      port map (I=>XLXN_88,
                O=>cathode(4));
   
   XLXI_25 : INV
      port map (I=>XLXN_89,
                O=>cathode(5));
   
   XLXI_26 : INV
      port map (I=>XLXN_90,
                O=>cathode(6));
   
   XLXI_27 : slowclk_MUSER_lab4_seven_segment_display
      port map (XLXN_7=>XLXN_120,
                XLXN_23=>XLXN_121);
   
   XLXI_28 : slowclk_MUSER_lab4_seven_segment_display
      port map (XLXN_7=>XLXN_119,
                XLXN_23=>XLXN_120);
   
   XLXI_29 : slowclk_MUSER_lab4_seven_segment_display
      port map (XLXN_7=>XLXN_116,
                XLXN_23=>XLXN_119);
   
   XLXI_30 : slowclk_MUSER_lab4_seven_segment_display
      port map (XLXN_7=>clk,
                XLXN_23=>XLXN_116);
   
end BEHAVIORAL;



