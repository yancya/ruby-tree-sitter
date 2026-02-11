# frozen_string_literal: true

require_relative '../test_helper'

describe 'QueryCursor' do
  it 'must not emit redefined warnings when loading the extension' do
    lib_path = File.expand_path('../../lib', __dir__)
    output = IO.popen(
      [RbConfig.ruby, '-W', '-I', lib_path, '-e', "require 'tree_sitter'"],
      err: %i[child out],
      &:read
    )
    refute_match(/redefined/, output,
                 "Loading tree_sitter should not produce 'redefined' warnings:\n#{output}")
  end
end
