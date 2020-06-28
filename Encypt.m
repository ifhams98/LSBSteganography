c = imread('C:\Users\Ifham Shahid\Desktop\image.png'); %path to read the image
msg = 'black lives matter';
c(1:1:1)= length(msg) ; %to count message Char to easily retrieve the message 
c=imresize(c,[size(c,1) size(c,2)],'nearest');
message = msg;
message = strtrim(message);
m = length(message) * 8;
AsciiCode = uint8(message);
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1);
for k = 1:N
  if(binaryString(k) == '1')
      b(k) = 1;
  else
      b(k) = 0;
  end
end
s = c;
  height = size(c,1);
  width = size(c,2);
k = 1;
for i = 1 : height
  for j = 1 : width
      LSB = mod(double(c(i,j)), 2);
      if (k>m || LSB == b(k))
          s(i,j) = c(i,j);
      elseif(LSB == 1)
          s(i,j) = (c(i,j) - 1);
      elseif(LSB == 0)
          s(i,j) = (c(i,j) + 1);
      end
  k = k + 1;
  end
