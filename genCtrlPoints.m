function ctrlPoints = genCtrlPoints(blocks, i, j)

    if (blocks(1, 1, 5) & blocks(1, 1, 7) & blocks(1, 1, 8)) %same
        ctrlPoints = [0.0 0.0 0.0 0.0 0.0];
        
    elseif (blocks(1, 1, 8) & ~blocks(1, 1, 5) & ~blocks(1, 1, 7)) %pos-cross \
        ctrlPoints = [2.0 (i+1.25) (j+0.75) (i+0.75) (j+1.25)];
    elseif (blocks(1, 2, 6) & ~blocks(1, 2, 4) & ~blocks(1, 2, 7)) %neg-cross /
        ctrlPoints = [2.0 (i+0.75) (j+0.75) (i+1.25) (j+1.25)];

    elseif (blocks(1, 1, 5) & blocks(1, 1, 7) & ~blocks(1, 1, 8)) %right-bottom-corner
        ctrlPoints = [1.0 (i+1.25) (j+1.25) 0.0 0.0];
    elseif (blocks(1, 2, 4) & blocks(1, 2, 7) & ~blocks(1, 2, 6)) %left-bottom-corner
        ctrlPoints = [1.0 (i+0.75) (j+1.25) 0.0 0.0];
    elseif (blocks(2, 1, 2) & blocks(2, 1, 5) & ~blocks(2, 1, 3)) %right-top-corner
        ctrlPoints = [1.0 (i+1.25) (j+0.75) 0.0 0.0];
    elseif (blocks(2, 2, 2) & blocks(2, 2, 4) & ~blocks(2, 2, 1)) %left-top-corner
        ctrlPoints = [1.0 (i+0.75) (j+0.75) 0.0 0.0];
        
    elseif (blocks(1, 1, 7) & blocks(1, 2, 7) & ~blocks(1, 1, 5) & ~blocks(2, 1, 5)) %vertical-side
        ctrlPoints = [1.0 (i+1) (j+1) 0.0 0.0];
    elseif (~blocks(1, 1, 7) & ~blocks(1, 2, 7) & blocks(1, 1, 5) & blocks(2, 1, 5)) %horizontal-side
        ctrlPoints = [1.0 (i+1) (j+1) 0.0 0.0];

    else
        ctrlPoints = [5.0 0.0 0.0 0.0 0.0];
    end

end

