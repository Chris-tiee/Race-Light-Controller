-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;



entity raceController is
	port (
    i_clk : in std_logic ;
    i_reset_n : in std_logic ;
    i_start : in std_logic ;
    o_red : out std_logic ;
    o_yellow : out std_logic ;
    o_green : out std_logic
	);
end raceController ;

architecture structural of raceController is
	signal o_q0, o_q0_n, o_q1, o_q1_n, o_q2, o_q2_n, i_j0, i_2 : std_logic;
    
    component jkff
    	port( i_clk : in std_logic;
    	      i_clr_n : in std_logic;
              i_j : in std_logic;
              i_k : in std_logic;
              o_q : out std_logic;
              o_q_n : out std_logic);
	end component;
begin
	i_j0<= (i_start) or (o_q2) or (o_q1);
    i_2 <= o_q0 and o_q1;
    
	stage0: jkff port map(i_clk=>i_clk, 
    					  i_clr_n=> i_reset_n,
                          i_j=> i_j0,
                          i_k=>'1',
                          o_q=>o_q0,
                          o_q_n=>o_q0_n);
    stage1: jkff port map(i_clk=>i_clk, 
    					  i_clr_n=> i_reset_n,
                          i_j=> o_q0,
                          i_k=>o_q0,
                          o_q=>o_q1,
                          o_q_n=>o_q1_n);
    stage2: jkff port map(i_clk=>i_clk, 
    					  i_clr_n=> i_reset_n,
                          i_j=> i_2,
                          i_k=> i_2,
                          o_q=>o_q2,
                          o_q_n=>o_q2_n); 
                          
    o_red<= o_q1_n and o_q2_n;
    o_yellow <= o_q1 and o_q2_n;
    o_green <= o_q2;
    
	                       
                          
end structural;
