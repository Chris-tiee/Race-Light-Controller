-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity raceControllerTB is
end raceControllerTB;

architecture driver of raceControllerTB is
	component raceController
      port (
      i_clk : in std_logic ;
      i_reset_n : in std_logic ;
      i_start : in std_logic ;
      o_red : out std_logic ;
      o_yellow : out std_logic ;
      o_green : out std_logic
      );
    end component;
    
    signal tb_clk: std_logic:='0';
    signal tb_reset: std_logic:='0';
    signal tb_start: std_logic:= '0';
    signal tb_red: std_logic:= '0';
    signal tb_yellow: std_logic :='0';
    signal tb_green: std_logic :='0';
    
begin 
	UUT: raceController port map(i_clk=>tb_clk, 
    							 i_reset_n=>tb_reset,
                                 i_start=>tb_start,
                                 o_red=>tb_red,
                                 o_yellow=> tb_yellow,
                                 o_green=> tb_green);
    clock:process
    begin
        for i in 1 to 20 loop
          tb_clk <= '0';
          wait for 10 ns ;
          tb_clk <= '1';
          wait for 10 ns ;
        end loop ;
		
	  wait ;
    end process ;
    
    start: process
    begin
        
    	for i in 1 to 20 loop
          tb_start<= '0';
          wait for 14 ns;
          tb_start <='1';
          wait for 14 ns;
		end loop;
        wait;
    end process;
    tb_reset<='1' after 1 ns, '0' after 150 ns, '1' after 152 ns;
    
   
end driver;
