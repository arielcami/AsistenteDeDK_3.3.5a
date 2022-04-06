--[[    Ariel Camilo // ariel.cami@gmail.com // 6 de Marzo 2022

    Este script hará que se muestren algunos textos en rojo por consola.
    Esto es totalmente normal y no afecta en nada, esto quizá se debe a
    algun pequeño bug en la relación Eluna/Emulador cada que se aprende una spell vía script, solo ignóralos.
]]

local Level = 80  --> Coloca el nivel que se le dará a los jugadores.
local NpcID = 000 --> Reemplaza 000 con el id del NPC que estará a cargo de este script.

local RAZ = {[1]={12742},[2]={12748},[4]={12744},[8]={12743},[16]={12750},[32]={12739},[64]={12745},[128]={12749},[512]={12747},[1024]={12746}}
local HO1 = {12593,12619,12842,12848,12636,12641,12657,12849,12850,12670,12678,12680,12679,12733,12687,12697,12698,12700,12701,12706,
             12714,12716,12715,12719,12722,12720,12723,12724,12725,12727,12738}
local AL1 = {12593,12619,12842,12848,12636,12641,12657,12849,12850,12670,12678,12680,12679,12733,12687,12697,12698,12700,12701,12706,
             12714,12716,12715,12719,12722,12720,12723,12724,12725,12727,12738}
local HO2 = {12751,12754,12755,12756,12757,12778,12779,12800,12801,13165,13166,13189}
local AL2 = {12751,12754,12755,12756,12757,12778,12779,12800,12801,13165,13166,13188}

local function Click(E,P,U) P:GossipMenuAddItem(0, '¡Completar todas las misiones de DK!', 100, 1) P:GossipSendMenu(1, U, MenuId) end

local function Menu(e,P,U,S,I)   local H, R, C = P:IsHorde(), P:GetRaceMask(), P:GetClassMask()   U:SendUnitSay('Completando misiones...',0)

    local function Quests(qq) P:AddQuest(qq) P:CompleteQuest(qq) P:RewardQuest(qq) end
    
    if S == 100 then   if C==32 then   if H then   
                    for i=1, #HO1 do Quests( HO1[i] ) end Quests( RAZ[R][1] )
                    for i=1, #HO2 do Quests( HO2[i] ) end P:Teleport(1, 1643.5269, -4411.58, 16.9977, 5.1409) 
            else    for i=1, #AL1 do Quests( AL1[i] ) end Quests( RAZ[R][1] ) 
                    for i=1, #AL2 do Quests( AL2[i] ) end P:Teleport(0, -8843.5966, 642.2538, 95.8736, 5.4346)
            end P:SetLevel(Level) P:AddItem(38632,1) P:SendBroadcastMessage('|cff42e6ffNo es necesario hacer más nada, continua jugando normalmente.')
        else
        U:SendUnitSay("Esta promoción no aplica para tu clase.", 0) P:GossipComplete() 
        end 
    end    
end
RegisterCreatureGossipEvent(NpcID, 1, Click)
RegisterCreatureGossipEvent(NpcID, 2, Menu)
