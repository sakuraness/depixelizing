function result = mixrgb(top, bot, left, right)

[top, bot, left, right] = double(top, bot, left, right);
result = sum(top, bot, left, right);
result = uint8(result);

end

