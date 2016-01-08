{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import Control.Monad
import Data.Monoid ((<>), mappend, mconcat)
import qualified Data.Map

import Text.Pandoc
import Hakyll
import Hakyll.Web.Pandoc

myConfiguration = defaultConfiguration {
  deployCommand = "rsync -avz --delete ./_site/ root@www.e5.physik.tu-dortmund.de:/usr/local/www/apache22/data/masterclasses"
}

navbar =  [ ("Home", "/index.html")
          ]

main = hakyllWith myConfiguration $ do
  match "img/*" $ do
    route   idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route   idRoute
    compile copyFileCompiler --compressCssCompiler

  match "js/*" $ do
    route   idRoute
    compile copyFileCompiler

  match "files/*" $ do
    route   idRoute
    compile copyFileCompiler

  match "templates/*" $ compile templateCompiler

  match "*.md" $ do
    route $ setExtension "html"
    compile $ myPandocC
        >>= loadAndApplyTemplate "templates/default.html" context
        >>= relativizeUrls

navbarCompiler item = do
  -- Get the url of this page
  url <- fmap (maybe empty toUrl) $ getRoute $ itemIdentifier item
  return $ generateNavbar url

generateNavbar url = concat $ do
  (t, l) <- navbar
  -- if the url matches, this tab is active
  let cl = if l == url
        then "class=\"active\""
        else ""
  return $ concat ["<li ", cl, "><a href=\"", l, "\">", t, "</a></li>\n"]

context :: Context String
context = mconcat
  [ mathjaxCtx
  , field "navbar" navbarCompiler
  , dateField "date" "%B %e, %Y"
  , defaultContext
  ]

myPandocC = pandocCompilerWith defaultHakyllReaderOptions pandocOptions

postList :: ([Item String] -> Compiler [Item String]) -> Compiler String
postList sortFilter = do
  posts    <- loadAll "posts/*"
  filtered <- sortFilter posts
  itemTpl  <- loadBody "templates/post-item.html"
  list     <- applyTemplateList itemTpl context filtered
  return list

pandocOptions = defaultHakyllWriterOptions
  { writerHTMLMathMethod = MathJax ""
  }

mathjaxCtx = field "mathjax" $ \item -> do
  metadata <- getMetadata (itemIdentifier item)
  return $ case Data.Map.lookup "math" metadata of
    Just "true" -> "<script type=\"text/x-mathjax-config\">MathJax.Hub.Config({messageStyle: \"none\",});</script>\
                   \<script type=\"text/javascript\" src=\"http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML\" />"
    Just _ -> ""
    Nothing -> ""


