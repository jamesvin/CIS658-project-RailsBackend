require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.create(title: "a title", article: "This is the actual text of ou
r article. It can be rather long.", likes: 0)
  end
test "post must be valid" do
   assert @post.valid?
end

test "title must be present" do
   @post.title = ""
   assert_not @post.valid?
end

test "title must not be too short" do
   @post.title = "aa"
   assert_not @post.valid?
end

test "title must not be too long" do
  @post.title = "a" * 81
   assert_not @post.valid?
end

test "article must be present" do
 @post.article = ""
 assert_not @post.valid?
end

test "article must not be too short" do
 @post.article = "aa"
 assert_not @post.valid?
end

test "article must not be too long" do
 @post.article = "a" * 601
 assert_not @post.valid?
end

test "likes must be postive" do
 @post.likes = -1
 assert_not @post.valid?
end

end
