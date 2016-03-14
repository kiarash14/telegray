do
TMP = {}

function First( msg )
 local Xdata = load_data(_config.moderation.data);

 if ( not Xdata[tostring(msg.to.id)]["settings"]["Blocked_Words"] ) then
  Xdata[tostring(msg.to.id)]["settings"]["Blocked_Words"] = TMP
  save_data(_config.moderation.data, Xdata);
  print("i couldn't find the table so i created it :)")
 else
  print("Table is here i can't create it")
 end
end

function InsertWord( data, word, msg )
 if ( not is_momod(msg) ) then
  send_large_msg ( get_receiver(msg) , "@" .. msg.from.username .. " Only admin can do it :P" );
  return
 end

 TTable = data[tostring(msg.to.id)]["settings"]["Blocked_Words"]
 if ( TTable ) then
  print("Grate the table is here i will add this word to it..")
  send_large_msg ( get_receiver(msg) , "The word " .. word .. " added to the blocked words!" );
  table.insert(TTable, word)
  save_data(_config.moderation.data, data);
 else
  print("i can't add this word")
 end
end

function RemoveWord( data, index, msg )
 if ( not is_momod(msg) ) then
  send_large_msg ( get_receiver(msg) , "@" .. msg.from.username .. " Only admin can do it :P" );
  return
 end

 index = tonumber(index)
 TTable = data[tostring(msg.to.id)]["settings"]["Blocked_Words"]
 print( "trying to remove the word : " .. tostring(TTable.index))

 if ( TTable ) then
  print("Grate the table is here i will remove this word from it..")
  send_large_msg ( get_receiver(msg) , "The word " .. tostring(TTable[index]) .. " removed from the blocked words!" );
  table.remove(TTable, index)
  save_data(_config.moderation.data, data);
 else
  print("i can't remove this word")
 end
end

function ClearWords( data, msg )
 TTable = data[tostring(msg.to.id)]["settings"]["Blocked_Words"]
 print( "trying to remove all the