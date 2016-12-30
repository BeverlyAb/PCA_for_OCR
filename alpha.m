function [ letter ] = alpha( index )
% returns the corresponding char to based of off the index
% given by trueIndex(X)
if(index <= 5) 
    letter = 'A';
end
if(index > 5 && index <= 10)
        letter = 'B';
end
if(index > 10 && index <= 15)
        letter = 'C';
end  
if(index > 15 && index <= 20)
        letter = 'D';
end
if(index > 20 && index <= 25)
        letter = 'E';
end  
if(index > 25 && index <= 30)
        letter = 'F';
end
if(index > 30 && index <= 35)
        letter = 'G';
end  
if(index > 35 && index <= 40)
        letter = 'H';
end
if(index > 40 && index <= 45)
        letter = 'I';
end  
if(index > 45 && index <= 50)
        letter = 'J';
end
if(index > 50 && index <= 55)
        letter = 'K';
end  
if(index > 55 && index <= 60)
        letter = 'L';
end
if(index > 60 && index <= 65)
        letter = 'M';
end  
if(index > 65 && index <= 70)
        letter = 'N';
end
if(index > 70 && index <= 75)
        letter = 'O';
end  
if(index > 75 && index <= 80)
        letter = 'P';
end
if(index > 80 && index <= 85)
        letter = 'Q';
end  
if(index > 85 && index <= 90)
        letter = 'R';
end
if(index > 90 && index <= 95)
        letter = 'S';
end
if(index > 95 && index <= 100)
        letter = 'T';
end
if(index > 100 && index <= 105)
        letter = 'U';
end 
if(index > 105 && index <= 110)
        letter = 'V';
end
if(index > 110 && index <= 115)
        letter = 'W';
end  
if(index > 115 && index <= 120)
        letter = 'X';
end
if(index > 120 && index <= 125)
        letter = 'Y';
end  
if(index > 125 && index <= 130)
        letter = 'Z';
end
if(index > 130 && index <= 135)
        letter = ' ';
end  

end

