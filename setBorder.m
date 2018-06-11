function borders = setBorder(ctrlPoints)

borders = [];
[r, l, k] = size(ctrlPoints);

[r, l]

for i = 1:r
    for j = 1:l
        
        curCP = ctrlPoints(i, j, :);
        
        %% bot link area
        if (i < r) % set bot link
            botCP = ctrlPoints(i+1, j, :);
            
            if (curCP(6) == 0) %same
                % set nothing
            elseif (curCP(6) == 1) %pos-cross \
                % bot link
                if (botCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); botCP(4), botCP(5)];
                elseif (botCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                end

            elseif (curCP(6) == 2) %neg-cross /
                % bot link
                if (botCP(6) == 1)
                    borders = [borders; curCP(4), curCP(5); botCP(4), botCP(5)];
                elseif (botCP(6) == 2)
                    borders = [borders; curCP(4), curCP(5); botCP(2), botCP(3)];
                else
                    borders = [borders; curCP(4), curCP(5); botCP(2), botCP(3)];
                end

            elseif (curCP(6) == 3) %right-bottom-corner
                % bot link
                if (botCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); botCP(4), botCP(5)];
                elseif (botCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                end

            elseif (curCP(6) == 4) %left-bottom-corner
                % bot link
                if (botCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); botCP(4), botCP(5)];
                elseif (botCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                end

            elseif (curCP(6) == 5) %right-top-corner
                % no any link
                
            elseif (curCP(6) == 6) %left-top-corner
                % no any link

            elseif (curCP(6) == 7) %vertical-side
                % bot link
                if (botCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); botCP(4), botCP(5)];
                elseif (botCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); botCP(2), botCP(3)];
                end

            elseif (curCP(6) == 8) %horizontal-side
                % no bot link
                
            end
            
        end
        
        %% right link area
        if (j < l) % set right link
            
            rightCP = ctrlPoints(i, j+1, :);
            
            if (curCP(6) == 0) %same
                % set nothing
            elseif (curCP(6) == 1) %pos-cross \
                % right link
                if (rightCP(6) == 1)
                    borders = [borders; curCP(4), curCP(5); rightCP(2), rightCP(3)];
                elseif (rightCP(6) == 2)
                    borders = [borders; curCP(4), curCP(5); rightCP(2), rightCP(3)];
                else
                    borders = [borders; curCP(4), curCP(5); rightCP(2), rightCP(3)];
                end

            elseif (curCP(6) == 2) %neg-cross /
                % right link
                if (rightCP(6) == 1)
                    borders = [borders; curCP(4), curCP(5); rightCP(2), rightCP(3)];
                elseif (rightCP(6) == 2)
                    borders = [borders; curCP(4), curCP(5); rightCP(2), rightCP(3)];
                else
                    borders = [borders; curCP(4), curCP(5); rightCP(2), rightCP(3)];
                end

            elseif (curCP(6) == 3) %right-bottom-corner
                % right link
                if (rightCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                elseif (rightCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                end
                
            elseif (curCP(6) == 4) %left-bottom-corner
                % no right link

            elseif (curCP(6) == 5) %right-top-corner
                % right link
                if (rightCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                elseif (rightCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                end

                % no bot link

            elseif (curCP(6) == 6) %left-top-corner
                % no any link

            elseif (curCP(6) == 7) %vertical-side
                % no right link

            elseif (curCP(6) == 8) %horizontal-side
                % right link
                if (rightCP(6) == 1)
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                elseif (rightCP(6) == 2)
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                else
                    borders = [borders; curCP(2), curCP(3); rightCP(2), rightCP(3)];
                end

                % no bot link

            end
            
        end
        
    end
end

end

