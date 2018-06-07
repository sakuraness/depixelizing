function output = step_one(input)
    %input=double(input)/255;%don't need to turn to float
    height=size(input,1);
    width=size(input,2);
    %output=uint8(zeros(height,width,8));
    %imshow(input);
    input_yuv=zeros(height,width,3);
    
    %turn rgb to yuv color
    for i=1:height
        for j=1:width
            r=input(i,j,1);
            g=input(i,j,2);
            b=input(i,j,3);
            input_yuv(i,j,:)=[0.299*r+0.587*g+0.114*b,-0.169*r-0.331*g+0.5*b+128,0.5*r-0.419*g-0.081*b+128];
        end
    end
    %input_yuv
    %find the similar pixels near
    tmp=uint8(zeros(height,width,8));
    a=[-1,-1;-1,0;-1,1;0,-1;0,1;1,-1;1,0;1,1];
    for i=1:height
        for j=1:width
            for k=1:8
                new_i=i+a(k,1);
                new_j=j+a(k,2);
                if(new_i<1||new_j<1||new_i>height||new_j>width)
                    continue;
                else
                    y=abs(input_yuv(i,j,1)-input_yuv(new_i,new_j,1));
                    u=abs(input_yuv(i,j,2)-input_yuv(new_i,new_j,2));
                    v=abs(input_yuv(i,j,3)-input_yuv(new_i,new_j,3));
                    if(y<=48&&u<=7&&v<=6)
                        tmp(i,j,k)=1;
                    end
                end
            end
        end
    end
    %{
    tmp,output
    1 2 3
    4 x 5
    6 7 8
    points
    1 2
    3 4
    %}
    output=tmp;
    %check for 2*2 windows
    for i=1:height-1
        for j=1:width-1
            points=[i,j;i,j+1;i+1,j;i+1,j+1];
            %if the window is full connect
            %{
            if(tmp(points(1,1),points(1,2),5)==1&&tmp(points(1,1),points(1,2),7)==1&&...
            tmp(points(2,1),points(2,2),4)==1&&tmp(points(2,1),points(2,2),7)==1&&...
            tmp(points(3,1),points(3,2),5)==1&&tmp(points(3,1),points(3,2),2)==1&&...
            tmp(points(4,1),points(4,2),4)==1&&tmp(points(4,1),points(4,2),2)==1)
                output(points(1,1),points(1,2),8)=0;
                output(points(2,1),points(2,2),6)=0;
                output(points(3,1),points(3,2),3)=0;
                output(points(4,1),points(4,2),1)=0;
            %}
            %if there're two diagonals in the window
            if(tmp(points(1,1),points(1,2),5)~=1&&tmp(points(1,1),points(1,2),7)~=1&&...
            tmp(points(2,1),points(2,2),4)~=1&&tmp(points(2,1),points(2,2),7)~=1&&...
            tmp(points(3,1),points(3,2),5)~=1&&tmp(points(3,1),points(3,2),2)~=1&&...
            tmp(points(4,1),points(4,2),4)~=1&&tmp(points(4,1),points(4,2),2)~=1&&...
            tmp(points(1,1),points(1,2),8)==1&&tmp(points(2,1),points(2,2),6)==1&&...
            tmp(points(3,1),points(3,2),3)==1&&tmp(points(4,1),points(4,2),1)==1)
                %use "fir" and "sec" to record points in three heuristics.
                fir=0;%left up to right down 
                sec=0;%right up to left down
                
                %calculete for islands
                [fir,sec]=islands(fir,sec,points,tmp);
                %calculate for number of sparse pixels
                [fir,sec]=sparse_pixels(fir,sec,points,tmp);
                %calculate for curves length
                [fir,sec]=curves(fir,sec,points,tmp);
                %compare the result and remove one of two diagonals
                %for debug
            %[points(1,1),points(1,2),points(2,1),points(2,2),points(3,1),points(3,2),points(4,1),points(4,2),fir,sec]
                if(fir>sec)
                    output(points(2,1),points(2,2),6)=0;
                    output(points(3,1),points(3,2),3)=0;
                elseif(sec>fir)
                    output(points(1,1),points(1,2),8)=0;
                    output(points(4,1),points(4,2),1)=0;
                %the case that "fir" equals to "sec", pick the diagonals
                %with light color, remove the other one.
                else
                    a=sum(input(points(1,1),points(1,2),:))+sum(input(points(4,1),points(4,2),:));
                    b=sum(input(points(2,1),points(2,2),:))+sum(input(points(3,1),points(3,2),:));
                    if(a>b)
                        output(points(2,1),points(2,2),6)=0;
                        output(points(3,1),points(3,2),3)=0;
                    else
                        output(points(1,1),points(1,2),8)=0;
                        output(points(4,1),points(4,2),1)=0;
                    end
                end
            end
        end
    end
end

