function y = f1(x)
    y = zeros(1,100);
    for i = 1:length(x)
        if( x(i) <= -1)
           y(i) = 1;
        elseif((x(i) > -1) && (x(i) <= 1))
            y(i) = -x(i);
        else
            y(i) = -1;
        end
    end
end