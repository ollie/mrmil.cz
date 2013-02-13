    if ($party == true)
    {
      if (empty($wallet) and function_exists('walk'))
      {
        if ($bouncer == false)
        {
          exit;
        }
        else
        {
          die();
        }
      }
    }
