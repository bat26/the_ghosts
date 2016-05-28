/*
    chatter.sqf
    This function provides sounds effects causing the squad to begin chatting at the start of the mission to add some ambience
*/

_sound = ["hq_intro_message1","hq_intro_message2","hq_intro_message3", "hq_intro_message4", "hq_intro_message5"] call BIS_fnc_selectRandom;
//_sound ={["\sounds\rainbow\hq\jcf_gen1.wav","\sounds\rainbow\hq\jcf_gen2.wav","\sounds\rainbow\hq\jcf_gen3.wav", "\sounds\rainbow\hq\jcf_gen4.wav", "\sounds\rainbow\hq\jcf_gen4.wav5"] call BIS_fnc_selectRandom, 1.3, 1.0};  
playSound _sound;