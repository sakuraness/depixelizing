function output = check_islands(input,n)
    output=1;
    for i=1:8
        if i~=n&&input(1,1,i)==1
            output=0;
        end
    end
end

