-- leap.nvim - Helix-style word jumping with gw
return {
    url = 'https://codeberg.org/andyg/leap.nvim',
    config = function()
        local leap = require('leap')

        -- Recommended: define a preview filter to reduce visual noise
        -- Skip preview if the first character of the match is whitespace
        -- or is in the middle of an alphabetic word
        leap.opts.preview = function(ch0, ch1, ch2)
            return not (
                ch1:match('%s')
                or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
            )
        end

        -- Define equivalence classes for brackets and quotes
        leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

        -- Use traversal keys to repeat the previous motion
        require('leap.user').set_repeat_keys('<enter>', '<backspace>')
    end,
}
