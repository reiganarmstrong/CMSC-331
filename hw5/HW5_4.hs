module HW5_4 where 
-- Reagan Armstrong (reagana1) 

rmax [] =[]
rmax list =
    let max = maximum list
    in
        [x|x<-list,x/=max]